import 'package:flutter/foundation.dart';

class CurrencyProvider with ChangeNotifier {
  String _selectedCurrency = 'USD';

  String get selectedCurrency => _selectedCurrency;

  void setSelectedCurrency(String currency) {
    _selectedCurrency = currency;
    notifyListeners();
  }
}
