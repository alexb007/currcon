import "package:bloc/bloc.dart";
import "package:currcon/app/common/constants.dart";
import "package:currcon/main.dart";
import "package:meta/meta.dart";

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<ChangeCurrencyFrom>((event, emit) async {
      final currencyTo = (state is HomeLoaded)
          ? (state as HomeLoaded).currencyTo
          : currencies.where((cur) => cur != event.currency).first;
      emit(HomeLoading());
      try {
        final ratesResponse = await apiClient.getCurrencyRates(event.currency);
        emit(HomeLoaded(ratesResponse.conversionRates,
            currencyFrom: event.currency, currencyTo: currencyTo));
      } catch (error) {
        emit(HomeLoadError(error.toString()));
      }
    });

    on<ChangeCurrencyTo>((event, emit) async {
      final rates = (state as HomeLoaded).rates;
      final currencyFrom = (state as HomeLoaded).currencyFrom;
      emit(HomeLoading());
      emit(HomeLoaded(rates,
          currencyTo: event.currency, currencyFrom: currencyFrom));
    });
  }
}
