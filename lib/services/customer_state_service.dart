import '../models/customer.dart';

class CustomerStateService {
  // Singleton pattern
  static final CustomerStateService _instance = CustomerStateService._internal();
  factory CustomerStateService() => _instance;
  CustomerStateService._internal();

  // Store the selected customer
  Customer? _selectedCustomer;
  Customer? get selectedCustomer => _selectedCustomer;

  // Set selected customer
  void setSelectedCustomer(Customer customer) {
    _selectedCustomer = customer;
    print('✅ CustomerStateService: Selected customer set - ${customer.name} (${customer.code})');
  }

  // Clear selected customer
  void clearSelectedCustomer() {
    _selectedCustomer = null;
    print('🗑️ CustomerStateService: Selected customer cleared');
  }

  // Check if customer is selected
  bool get hasSelectedCustomer => _selectedCustomer != null;

  // Get customer info for display
  Map<String, dynamic>? getSelectedCustomerInfo() {
    if (_selectedCustomer == null) return null;
    
    return {
      'code': _selectedCustomer!.code,
      'name': _selectedCustomer!.name,
      'contactName': _selectedCustomer!.contactName,
      'email': _selectedCustomer!.email,
      'telNo': _selectedCustomer!.telNo,
      'address': _getFormattedAddress(),
      'status': _selectedCustomer!.status,
      'customerType': _selectedCustomer!.customerType,
    };
  }

  // Get formatted address
  String _getFormattedAddress() {
    if (_selectedCustomer == null) return '';
    
    final parts = <String>[];
    if (_selectedCustomer!.address1?.isNotEmpty == true) parts.add(_selectedCustomer!.address1!);
    if (_selectedCustomer!.address2?.isNotEmpty == true) parts.add(_selectedCustomer!.address2!);
    if (_selectedCustomer!.city?.isNotEmpty == true) parts.add(_selectedCustomer!.city!);
    if (_selectedCustomer!.state?.isNotEmpty == true) parts.add(_selectedCustomer!.state!);
    if (_selectedCustomer!.postcode?.isNotEmpty == true) parts.add(_selectedCustomer!.postcode!);
    
    return parts.join(', ');
  }
}
