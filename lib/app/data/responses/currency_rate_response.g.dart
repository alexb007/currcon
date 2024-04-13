// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_rate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyRateResponse _$CurrencyRateResponseFromJson(
        Map<String, dynamic> json) =>
    CurrencyRateResponse(
      json['result'] as String,
      (json['conversion_rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$CurrencyRateResponseToJson(
        CurrencyRateResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'conversion_rates': instance.conversionRates,
    };
