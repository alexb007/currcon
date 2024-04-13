import 'package:currcon/app/data/responses/currency_rate_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'currency_rate_service.g.dart';

@RestApi(
    baseUrl:
        'https://v6.exchangerate-api.com/v6/567e2c3057302f28aa862bab/latest')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/{currency}')
  Future<CurrencyRateResponse> getCurrencyRates(
      @Path('currency') String currency);
}
