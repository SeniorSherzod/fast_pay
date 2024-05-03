part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {

  final UserModel userModel;
  final FormsStatus status;
  final String errorMessage;
  final String statusMessage;


  const UserProfileState({
    required this.status,
    required this.userModel,
    required this.statusMessage,
    required this.errorMessage
});

UserProfileState copyWith({
    UserModel? userModel,
  FormsStatus? status,
  String? statusMessage,
  String? errorMessage
}){
  return UserProfileState(
    userModel: userModel ?? this.userModel,
    status: status ?? this.status,
    statusMessage: statusMessage ?? this.statusMessage,
    errorMessage: errorMessage ?? this.errorMessage
  );
}


  @override
  List<Object> get props => [
    status,
    userModel,
    statusMessage,
    errorMessage
  ];
}
