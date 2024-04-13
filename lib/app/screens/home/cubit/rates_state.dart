part of 'rates_cubit.dart';

@immutable
sealed class RatesState {}

final class RatesLoading extends RatesState {}

final class RatesLoaded extends RatesState {
  final Map<String, double> rates;
  RatesLoaded(this.rates);
}

final class RatesLoadError extends RatesState {
  final String error;
  RatesLoadError(this.error);
}
