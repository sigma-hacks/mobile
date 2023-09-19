part of 'card_cubit.dart';

@immutable
sealed class CardState {}

class CardInitial extends CardState {}

class CardLoading extends CardState {}

class CardLoaded extends CardState {
  CardLoaded({required this.response});

  final List<Card?> response;
}

class CardError extends CardState {
  CardError({required this.error});

  final String error;
}