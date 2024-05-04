part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckAuthenticationEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends AuthEvent {
  final String username;
  final String password;

  LoginUserEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [];
}

class RegisterUserEvent extends AuthEvent {
  final UserModel userModel;

  RegisterUserEvent({
    required this.userModel,
  });

  @override
  List<Object?> get props => [userModel];
}

class LogOutUserEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SignInWithGoogleEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
class IsValidToInsert extends AuthEvent {
  final String password;
  final String username;
  final String lastname;
  final String phone;
  final String confirmPassword;

  IsValidToInsert({
    required this.confirmPassword,
    required this.lastname,
    required this.password,
     required this.username,
    required this.phone
});

  @override
  List<Object?> get props => [
    password,
    lastname,
    phone,
    username,
    confirmPassword
  ];
}