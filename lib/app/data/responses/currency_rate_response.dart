import 'package:json_annotation/json_annotation.dart';

part 'currency_rate_response.g.dart';

@JsonSerializable()
class CurrencyRateResponse {
  final String result;
  final Map<String, double> conversionRates;

  factory CurrencyRateResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateResponseFromJson(json);

  CurrencyRateResponse(this.result, this.conversionRates);

  Map<String, dynamic> toJson() => _$CurrencyRateResponseToJson(this);
}
