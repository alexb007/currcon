import 'package:bloc/bloc.dart';
import 'package:currcon/app/data/services/currency_rate_service.dart';
import 'package:meta/meta.dart';

part 'rates_state.dart';

class RatesCubit extends Cubit<RatesState> {
  RatesCubit() : super(RatesLoading());

  void loadRates(String currency) async {
    emit(RatesLoading());
    try {
      final ratesResponse = await ApiService().getCurrencyRates(currency);
      emit(RatesLoaded(ratesResponse.conversionRates));
    } catch (ex) {
      emit(RatesLoadError(ex.toString()));
    }
  }
}
