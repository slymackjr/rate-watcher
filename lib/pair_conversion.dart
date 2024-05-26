import 'dart:convert';
import 'package:http/http.dart' as http;
class PairConversion {
  final String result;
  final String documentation;
  final String termsOfUse;
  final int timeLastUpdateUnix;
  final String timeLastUpdateUtc;
  final int timeNextUpdateUnix;
  final String timeNextUpdateUtc;
  final String baseCode;
  final String targetCode;
  final double conversionRate;

  PairConversion({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.timeLastUpdateUnix,
    required this.timeLastUpdateUtc,
    required this.timeNextUpdateUnix,
    required this.timeNextUpdateUtc,
    required this.baseCode,
    required this.targetCode,
    required this.conversionRate,
  });

  factory PairConversion.fromJson(Map<String, dynamic> json) {
    return PairConversion(
      result: json['result'],
      documentation: json['documentation'],
      termsOfUse: json['terms_of_use'],
      timeLastUpdateUnix: json['time_last_update_unix'],
      timeLastUpdateUtc: json['time_last_update_utc'],
      timeNextUpdateUnix: json['time_next_update_unix'],
      timeNextUpdateUtc: json['time_next_update_utc'],
      baseCode: json['base_code'],
      targetCode: json['target_code'],
      conversionRate: json['conversion_rate'].toDouble(),
    );
  }

  static Future<PairConversion> fetchData(String apiKey, String baseCode, String targetCode) async {
    final response = await http.get(
      Uri.parse('https://v6.exchangerate-api.com/v6/$apiKey/pair/$baseCode/$targetCode'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return PairConversion.fromJson(responseData);
    } else {
      throw Exception('Failed to load pair conversion');
    }
  }
}
