import 'dart:convert';

import 'package:currcon/app/data/responses/currency_rate_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<CurrencyRateResponse> getCurrencyRates(String currency) async {
    final response = await http.get(
      Uri.parse(
          "https://v6.exchangerate-api.com/v6/567e2c3057302f28aa862bab/latest/$currency"),
    );
    return CurrencyRateResponse.fromJson(
        json.decode(utf8.decode(response.bodyBytes)));
  }
}
