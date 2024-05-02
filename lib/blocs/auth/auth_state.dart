part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final FormsStatus status;

  const AuthState(
      {required this.status,
      required this.errorMessage,
      required this.statusMessage});

  AuthState copyWith({
    String? errorMessage,
    String? statusMessage,
    FormsStatus? status,
  }) {
    return AuthState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        statusMessage: statusMessage ?? this.statusMessage);
  }
  @override
  List<Object?> get props=>[
    status,
    statusMessage,
    errorMessage
  ];
}
