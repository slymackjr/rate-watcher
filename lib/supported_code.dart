/*
import 'dart:convert';
import 'package:http/http.dart' as http;

class SupportedCode {
  final String result;
  final String documentation;
  final String termsOfUse;
  final Map<String, String> supportedCodes;

  SupportedCode({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.supportedCodes,
  });

  factory SupportedCode.fromJson(Map<String, dynamic> json) {
    // Convert the list of supported codes to a map
    Map<String, String> supportedCodesMap = {};
    for (var codeInfo in (json['supported_codes'] as List<dynamic>)) {
      if (codeInfo is List && codeInfo.length >= 2) {
        supportedCodesMap[codeInfo[0]] = codeInfo[1];
      }
    }

    return SupportedCode(
      result: json['result'],
      documentation: json['documentation'],
      termsOfUse: json['terms_of_use'],
      supportedCodes: supportedCodesMap,
    );
  }

  static Future<SupportedCode> fetchData(String apiKey) async {
    final response = await http.get(
      Uri.parse('https://v6.exchangerate-api.com/v6/$apiKey/codes'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return SupportedCode.fromJson(responseData);
    } else {
      throw Exception('Failed to load supported codes');
    }
  }

  // Method to get the name for a specific key
  String getNameForKey(String key) {
    if (supportedCodes.containsKey(key)) {
      return supportedCodes[key]!;
    } else {
      throw Exception('Key $key not found in supported codes');
    }
  }
}
*/
import 'dart:convert';
import 'package:http/http.dart' as http;

class SupportedCode {
  final String result;
  final String documentation;
  final String termsOfUse;
  final Map<String, String> supportedCodes;

  SupportedCode({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.supportedCodes,
  });

  factory SupportedCode.fromJson(Map<String, dynamic> json) {
    // List of required currencies
    final List<String> requiredCurrencies = [
      'USD', 'EUR', 'GBP', 'PLN', 'KES', 'BIF', 'ZMW', 'TZS', 'MWK', 'RWF'
    ];

    // Convert the list of supported codes to a filtered map
    Map<String, String> supportedCodesMap = {};
    for (var codeInfo in (json['supported_codes'] as List<dynamic>)) {
      if (codeInfo is List && codeInfo.length >= 2 && requiredCurrencies.contains(codeInfo[0])) {
        supportedCodesMap[codeInfo[0]] = codeInfo[1];
      }
    }

    return SupportedCode(
      result: json['result'],
      documentation: json['documentation'],
      termsOfUse: json['terms_of_use'],
      supportedCodes: supportedCodesMap,
    );
  }

  static Future<SupportedCode> fetchData(String apiKey) async {
    final response = await http.get(
      Uri.parse('https://v6.exchangerate-api.com/v6/$apiKey/codes'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return SupportedCode.fromJson(responseData);
    } else {
      throw Exception('Failed to load supported codes');
    }
  }

  // Method to get the name for a specific key
  String getNameForKey(String key) {
    if (supportedCodes.containsKey(key)) {
      return supportedCodes[key]!;
    } else {
      throw Exception('Key $key not found in supported codes');
    }
  }
}
