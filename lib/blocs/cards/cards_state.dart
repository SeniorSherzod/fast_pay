part of 'cards_bloc.dart';

sealed class CardsState extends Equatable {
  const CardsState();
}

final class CardsInitial extends CardsState {
  @override
  List<Object> get props => [];
}
