part of 'cards_bloc.dart';

sealed class UserCardsEvent extends Equatable {}

class AddCardEvent extends UserCardsEvent {
  final CardModel cardModel;

  AddCardEvent(this.cardModel);

  @override
  List<Object?> get props => [cardModel];
}

class UpdateCardEvent extends UserCardsEvent {
  final CardModel cardModel;

  UpdateCardEvent({required  this.cardModel});

  @override
  List<Object?> get props => [cardModel];
}

class DeleteCardEvent extends UserCardsEvent {
  final CardModel cardModel;

  DeleteCardEvent(this.cardModel);

  @override
  List<Object?> get props => [cardModel];
}

class GetCardsUserByIdEvent extends UserCardsEvent {
  final String userId;

  GetCardsUserByIdEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}
class  GetCardsDatabaseEvent extends UserCardsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
