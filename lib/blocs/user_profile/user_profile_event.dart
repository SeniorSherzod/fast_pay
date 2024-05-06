part of 'user_profile_bloc.dart';

sealed class UserProfileEvent extends Equatable {}

class AddUserEvent extends UserProfileEvent {
  final UserModel userModel;

  AddUserEvent(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class UpdateUserEvent extends UserProfileEvent {
  final UserModel userModel;

  UpdateUserEvent(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class DeleteUserEvent extends UserProfileEvent {
  final UserModel userModel;

  DeleteUserEvent(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class GetUserByDocIdEvent extends UserProfileEvent {
  final String docId;

  GetUserByDocIdEvent({required this.docId});

  @override
  List<Object?> get props => [docId];
}

class GetCurrentEvent extends UserProfileEvent {
  final String uid;

  GetCurrentEvent(this.uid);

  @override
  List<Object?> get props => [uid];
}
