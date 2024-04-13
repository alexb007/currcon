part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final String currencyFrom;
  final String currencyTo;
  final Map<String, double> rates;

  HomeLoaded(this.rates, {this.currencyFrom = 'USD', this.currencyTo = 'RUB'});
}

final class HomeLoadError extends HomeState {
  final String error;

  HomeLoadError(this.error);
}
