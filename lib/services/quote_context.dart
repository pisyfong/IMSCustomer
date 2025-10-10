import 'activation_service.dart';

/// Simple in-memory holder for values needed across the app
/// Currently used to cache the quote prefix for quotation generation.
class QuoteContext {
  QuoteContext._();
  static final QuoteContext I = QuoteContext._();

  String? quotePrefix;

  /// Load quote prefix from secure storage (ActivationService)
  Future<void> loadFromStorage() async {
    quotePrefix = await ActivationService().getQuotePrefix();
  }

  /// Directly set the quote prefix (e.g., right after activation)
  void setQuotePrefix(String prefix) {
    quotePrefix = prefix;
  }
}
