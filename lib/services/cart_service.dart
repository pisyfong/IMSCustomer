import 'package:isar/isar.dart';
import '../models/cart_item.dart';
import '../main.dart';
import 'qty.dart';

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
    double quantity = 1,
    double foc = 0,
    double quantityLoose = 0,
    double focLoose = 0,
    String? remarks,
    double? balanceQuantity,
    double? balanceQuantityLoose,
    double? balanceFoc,
    double? balanceFocLoose,
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
          existingItem.quantity = existingItem.quantity + quantity;
          // The free and loose portions accumulate the same way the charged
          // quantity does — adding the same SKU twice must not discard the
          // FOC entered the first time.
          //
          // Rounded after each addition, not just at the end: 0.1 added ten
          // times drifts off 1.00 in binary floating point, and a cart line is
          // added to repeatedly by design.
          existingItem.foc = Qty.round(existingItem.focQty + foc);
          existingItem.quantityLoose =
              Qty.round(existingItem.looseQty + quantityLoose);
          existingItem.focLoose = Qty.round(existingItem.focLooseQty + focLoose);
          existingItem.gstPrice = gstPrice;
          existingItem.unitPrice = unitPrice;
          if (remarks != null && remarks.isNotEmpty) {
            existingItem.remarks = remarks;
          }
          await isar.cartItems.put(existingItem);
          print('📦 CART: Updated existing item SKU $skuNo, new qty: ${existingItem.quantity}'
              '${existingItem.focQty > 0 ? ' +${existingItem.focQty} FOC' : ''}'
              ', price: RM${gstPrice.toStringAsFixed(2)}');
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
            foc: foc,
            quantityLoose: quantityLoose,
            focLoose: focLoose,
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
  //
  // ORDER MATTERS: this list becomes the quotation's Sequence_No (checkout
  // assigns `index + 1`), so it has to be deterministic. Isar gives no order
  // guarantee for an unsorted query — results follow the index/storage layout
  // and can shift when a row is updated — which is why SQ line sequences came
  // out shuffled. [CartItem.compareForSequence] owns the rule: a manual order
  // set by dragging first, then the order things were added. Bumping the qty
  // of an existing SKU keeps its position, since neither `sortIndex` nor
  // `addedDate` is touched on update.
  Future<List<CartItem>> getCartItems({int? companyCode}) async {
    try {
      final items = companyCode != null
          ? await isar.cartItems
              .filter()
              .companyCodeEqualTo(companyCode)
              .findAll()
          : await isar.cartItems.where().findAll();
      items.sort(CartItem.compareForSequence);
      return items;
    } catch (e) {
      print('❌ CART ERROR: Failed to get cart items: $e');
      return [];
    }
  }

  /// Persists a manual line order, [orderedIds] being the ids top to bottom.
  ///
  /// Every line is numbered, not just the one that moved: a partial numbering
  /// would leave dragged and never-dragged lines interleaved, and the nulls
  /// would jump to the bottom the next time the cart was loaded.
  ///
  /// Rows whose index is already correct are not written back, so dragging one
  /// line in a long cart is a couple of writes rather than a full rewrite.
  Future<void> reorderCart(List<int> orderedIds) async {
    try {
      await isar.writeTxn(() async {
        final items = await isar.cartItems.getAll(orderedIds);
        final changed = <CartItem>[];
        for (var i = 0; i < items.length; i++) {
          final item = items[i];
          if (item == null) continue; // deleted from under us mid-drag
          if (item.sortIndex == i) continue;
          item.sortIndex = i;
          changed.add(item);
        }
        if (changed.isNotEmpty) await isar.cartItems.putAll(changed);
        print('📦 CART: Reordered ${orderedIds.length} line(s)'
            ', ${changed.length} rewritten');
      });
    } catch (e) {
      print('❌ CART ERROR: Failed to reorder cart: $e');
      throw Exception('Failed to reorder cart: $e');
    }
  }

  // Update item quantity
  //
  // Zeroing the charged quantity no longer implies removing the line: a
  // giveaway is a real order line with Quote_Quantity = 0 and Quote_Foc > 0.
  // The row only goes away once nothing is left on it at all.
  Future<void> updateQuantity(int cartItemId, double newQuantity) =>
      updateLineQuantities(cartItemId, quantity: newQuantity);

  /// Sets any combination of the four quantities on a line, leaving the ones
  /// not passed untouched.
  ///
  /// [removeWhenEmpty] must be false while the operator is typing into the
  /// line. Clearing a field to retype it passes through zero, and deleting the
  /// row at that moment would take the line away mid-keystroke.
  Future<void> updateLineQuantities(
    int cartItemId, {
    double? quantity,
    double? foc,
    double? quantityLoose,
    double? focLoose,
    bool removeWhenEmpty = true,
  }) async {
    try {
      await isar.writeTxn(() async {
        final item = await isar.cartItems.get(cartItemId);
        if (item == null) return;

        // The last gate before the row is persisted. Everything that reaches
        // the database goes through here or through addToCart, so rounding in
        // both means no caller can write a quantity the UI cannot show.
        if (quantity != null) item.quantity = quantity; // setter clamps+rounds
        if (foc != null) item.foc = Qty.round(foc < 0 ? 0 : foc);
        if (quantityLoose != null) {
          item.quantityLoose = Qty.round(quantityLoose < 0 ? 0 : quantityLoose);
        }
        if (focLoose != null) {
          item.focLoose = Qty.round(focLoose < 0 ? 0 : focLoose);
        }

        if (removeWhenEmpty && item.totalBaseUnits <= 0) {
          await isar.cartItems.delete(cartItemId);
          print('📦 CART: Removed item with ID $cartItemId (line now empty)');
          return;
        }

        await isar.cartItems.put(item);
        print('📦 CART: Item $cartItemId → qty ${item.quantity}'
            ', foc ${item.focQty}'
            ', loose ${item.looseQty}/${item.focLooseQty}');
      });
    } catch (e) {
      print('❌ CART ERROR: Failed to update quantities: $e');
      throw Exception('Failed to update quantities: $e');
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

  // Update item remarks
  Future<void> updateRemarks(int cartItemId, String newRemarks) async {
    try {
      final existingItem = await isar.cartItems.get(cartItemId);
      if (existingItem == null) {
        print('❌ CART ERROR: Item with ID $cartItemId not found');
        throw Exception('Cart item not found');
      }
      
      await isar.writeTxn(() async {
        existingItem.remarks = newRemarks.isEmpty ? null : newRemarks;
        await isar.cartItems.put(existingItem);
      });
      
      print('📦 CART: Updated remarks for item ID $cartItemId');
    } catch (e) {
      print('❌ CART ERROR: Failed to update remarks: $e');
      throw Exception('Failed to update remarks: $e');
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
      double totalQuantity = 0;
      double totalFoc = 0;
      double totalLoose = 0;

      for (final item in items) {
        totalAmount += item.subtotal;
        totalGstAmount += item.gstSubtotal;
        totalItems++;
        // `totalQuantity` stays the charged quantity, because it drives the
        // cart badge and the order totals. Free and loose units are reported
        // alongside rather than folded in, so a giveaway never inflates a
        // figure the customer is asked to pay against.
        totalQuantity += item.quantity;
        totalFoc += item.focQty;
        totalLoose += item.looseQty + item.focLooseQty;
      }

      return {
        'totalItems': totalItems,
        // Rounded once at the end: summing 2dp values can land on 12.000000002
        // and the badge would render that in full.
        'totalQuantity': Qty.round(totalQuantity),
        'totalFoc': totalFoc,
        'totalLoose': totalLoose,
        'totalAmount': totalAmount,
        'totalGstAmount': totalGstAmount,
        'items': items,
      };
    } catch (e) {
      print('❌ CART ERROR: Failed to get cart summary: $e');
      return {
        'totalItems': 0,
        'totalQuantity': 0.0,
        'totalFoc': 0.0,
        'totalLoose': 0.0,
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
