part of 'bottom_bloc.dart';

sealed class BottomState extends Equatable {
  const BottomState();
}

final class BottomInitial extends BottomState {
  @override
  List<Object> get props => [];
}
