part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ChangeCurrencyFrom extends HomeEvent {
  final String currency;
  ChangeCurrencyFrom(this.currency);
}

class ChangeCurrencyTo extends HomeEvent {
  final String currency;
  ChangeCurrencyTo(this.currency);
}
