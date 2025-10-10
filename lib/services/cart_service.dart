import 'package:isar/isar.dart';
import '../models/cart_item.dart';
import '../main.dart';

class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  // Add item to cart
  Future<void> addToCart({
    required int companyCode,
    required int skuNo,
    String? pluNo,
    required String description,
    required String uom,
    required double unitPrice,
    required double gstPrice,
    required double factor,
    int quantity = 1,
    String? remarks,
  }) async {
    try {
      await isar.writeTxn(() async {
        // Check if item already exists in cart
        final existingItem = await isar.cartItems
            .filter()
            .companyCodeEqualTo(companyCode)
            .skuNoEqualTo(skuNo)
            .uomEqualTo(uom)
            .findFirst();

        if (existingItem != null) {
          // Update quantity, price, and remarks of existing item
          existingItem.quantity += quantity;
          existingItem.gstPrice = gstPrice;
          existingItem.unitPrice = unitPrice;
          if (remarks != null && remarks.isNotEmpty) {
            existingItem.remarks = remarks;
          }
          await isar.cartItems.put(existingItem);
          print('📦 CART: Updated existing item SKU $skuNo, new qty: ${existingItem.quantity}, price: RM${gstPrice.toStringAsFixed(2)}');
        } else {
          // Add new item to cart
          final cartItem = CartItem.fromInventoryItem(
            companyCode: companyCode,
            skuNo: skuNo,
            pluNo: pluNo,
            description: description,
            uom: uom,
            unitPrice: unitPrice,
            gstPrice: gstPrice,
            factor: factor,
            quantity: quantity,
            remarks: remarks,
          );
          await isar.cartItems.put(cartItem);
          print('📦 CART: Added new item SKU $skuNo, qty: $quantity');
        }
      });
    } catch (e) {
      print('❌ CART ERROR: Failed to add item to cart: $e');
      throw Exception('Failed to add item to cart: $e');
    }
  }

  // Get all cart items
  Future<List<CartItem>> getCartItems({int? companyCode}) async {
    try {
      if (companyCode != null) {
        return await isar.cartItems
            .filter()
            .companyCodeEqualTo(companyCode)
            .findAll();
      } else {
        return await isar.cartItems.where().findAll();
      }
    } catch (e) {
      print('❌ CART ERROR: Failed to get cart items: $e');
      return [];
    }
  }

  // Update item quantity
  Future<void> updateQuantity(int cartItemId, int newQuantity) async {
    try {
      await isar.writeTxn(() async {
        final item = await isar.cartItems.get(cartItemId);
        if (item != null) {
          if (newQuantity <= 0) {
            await isar.cartItems.delete(cartItemId);
            print('📦 CART: Removed item with ID $cartItemId');
          } else {
            item.quantity = newQuantity;
            await isar.cartItems.put(item);
            print('📦 CART: Updated quantity for item ID $cartItemId to $newQuantity');
          }
        }
      });
    } catch (e) {
      print('❌ CART ERROR: Failed to update quantity: $e');
      throw Exception('Failed to update quantity: $e');
    }
  }

  // Update item price (GST price)
  Future<void> updatePrice(int cartItemId, double newPrice) async {
    try {
      // Read item first to check if it exists
      final existingItem = await isar.cartItems.get(cartItemId);
      if (existingItem == null) {
        print('❌ CART ERROR: Item with ID $cartItemId not found');
        throw Exception('Cart item not found');
      }
      
      // Check if price actually changed to avoid unnecessary updates
      final currentPrice = existingItem.gstPrice ?? 0.0;
      if ((currentPrice - newPrice).abs() < 0.001) {
        print('📦 CART: Price unchanged for item ID $cartItemId, skipping update');
        return;
      }
      
      // Perform the update in a new transaction
      await isar.writeTxn(() async {
        existingItem.gstPrice = newPrice;
        // Also update unit price (assuming GST price is the primary price)
        existingItem.unitPrice = newPrice / 1.06; // Reverse calculate unit price (assuming 6% GST)
        await isar.cartItems.put(existingItem);
      });
      
      print('📦 CART: Updated price for item ID $cartItemId to RM${newPrice.toStringAsFixed(2)}');
    } catch (e) {
      print('❌ CART ERROR: Failed to update price: $e');
      print('❌ Stack trace: ${StackTrace.current}');
      throw Exception('Failed to update price: $e');
    }
  }

  // Remove item from cart
  Future<void> removeFromCart(int cartItemId) async {
    try {
      await isar.writeTxn(() async {
        await isar.cartItems.delete(cartItemId);
        print('📦 CART: Removed item with ID $cartItemId');
      });
    } catch (e) {
      print('❌ CART ERROR: Failed to remove item from cart: $e');
      throw Exception('Failed to remove item from cart: $e');
    }
  }

  // Clear entire cart
  Future<void> clearCart({int? companyCode}) async {
    try {
      await isar.writeTxn(() async {
        if (companyCode != null) {
          final items = await isar.cartItems
              .filter()
              .companyCodeEqualTo(companyCode)
              .findAll();
          final ids = items.map((item) => item.id).toList();
          await isar.cartItems.deleteAll(ids);
          print('📦 CART: Cleared cart for company $companyCode');
        } else {
          await isar.cartItems.clear();
          print('📦 CART: Cleared entire cart');
        }
      });
    } catch (e) {
      print('❌ CART ERROR: Failed to clear cart: $e');
      throw Exception('Failed to clear cart: $e');
    }
  }

  // Get cart summary
  Future<Map<String, dynamic>> getCartSummary({int? companyCode}) async {
    try {
      final items = await getCartItems(companyCode: companyCode);
      
      double totalAmount = 0;
      double totalGstAmount = 0;
      int totalItems = 0;
      int totalQuantity = 0;

      for (final item in items) {
        totalAmount += item.subtotal;
        totalGstAmount += item.gstSubtotal;
        totalItems++;
        totalQuantity += item.quantity;
      }

      return {
        'totalItems': totalItems,
        'totalQuantity': totalQuantity,
        'totalAmount': totalAmount,
        'totalGstAmount': totalGstAmount,
        'items': items,
      };
    } catch (e) {
      print('❌ CART ERROR: Failed to get cart summary: $e');
      return {
        'totalItems': 0,
        'totalQuantity': 0,
        'totalAmount': 0.0,
        'totalGstAmount': 0.0,
        'items': <CartItem>[],
      };
    }
  }

  // Get cart item count
  Future<int> getCartItemCount({int? companyCode}) async {
    try {
      if (companyCode != null) {
        return await isar.cartItems
            .filter()
            .companyCodeEqualTo(companyCode)
            .count();
      } else {
        return await isar.cartItems.count();
      }
    } catch (e) {
      print('❌ CART ERROR: Failed to get cart count: $e');
      return 0;
    }
  }
}
