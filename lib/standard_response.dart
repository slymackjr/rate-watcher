import 'dart:convert';
import 'package:http/http.dart' as http;

class StandardResponse {
  final String result;
  final String documentation;
  final String termsOfUse;
  final int timeLastUpdateUnix;
  final String timeLastUpdateUtc;
  final int timeNextUpdateUnix;
  final String timeNextUpdateUtc;
  final String baseCode;
  final Map<String, double> conversionRates;

  StandardResponse({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.timeLastUpdateUnix,
    required this.timeLastUpdateUtc,
    required this.timeNextUpdateUnix,
    required this.timeNextUpdateUtc,
    required this.baseCode,
    required this.conversionRates,
  });

  // Factory constructor to create a StandardResponse object from a JSON map
  factory StandardResponse.fromJson(Map<String, dynamic> json) {
    final List<String> requiredCurrencies = [
      'USD', 'EUR', 'GBP', 'PLN', 'KES', 'BIF', 'ZMW', 'TZS', 'MWK', 'RWF'
    ];

    final Map<String, double> filteredConversionRates = Map.fromEntries(
      (json['conversion_rates'] as Map<String, dynamic>).entries
          .where((entry) => requiredCurrencies.contains(entry.key))
          .map((entry) => MapEntry(entry.key, entry.value.toDouble())),
    );

    return StandardResponse(
      result: json['result'],
      documentation: json['documentation'],
      termsOfUse: json['terms_of_use'],
      timeLastUpdateUnix: json['time_last_update_unix'],
      timeLastUpdateUtc: json['time_last_update_utc'],
      timeNextUpdateUnix: json['time_next_update_unix'],
      timeNextUpdateUtc: json['time_next_update_utc'],
      baseCode: json['base_code'],
      conversionRates: filteredConversionRates,
    );
  }

  // Static method to fetch StandardResponse data from the API
  static Future<StandardResponse> fetchData(String apiKey, String conversionFor) async {
    final response = await http.get(
      Uri.parse('https://v6.exchangerate-api.com/v6/$apiKey/latest/$conversionFor'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return StandardResponse.fromJson(responseData);
    } else {
      throw Exception('Failed to load standard response');
    }
  }

  // Method to get conversion rates for specified currencies
  Map<String, double> getConversionRatesFor(List<String> currencies) {
    return Map.fromEntries(
        conversionRates.entries
            .where((entry) => currencies.contains(entry.key))
    );
  }
}
