part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final FormsStatus status;
  final UserModel userModel;

  const AuthState(
      {required this.status,
      required this.errorMessage,
      required this.statusMessage,
        required  this.userModel
      });

  AuthState copyWith({
    String? errorMessage,
    String? statusMessage,
    FormsStatus? status,
    UserModel? userModel,
  }) {
    return AuthState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        statusMessage: statusMessage ?? this.statusMessage,
        userModel: userModel ?? this.userModel);
  }
  @override
  List<Object?> get props=>[
    status,
    statusMessage,
    errorMessage,
    userModel
  ];

  static AuthState init() {
    return AuthState(
      status: FormsStatus.pure,
      errorMessage: '',
      statusMessage: '',
      userModel: UserModel.initial(), // Assuming UserModel has its own `init()` method or a default constructor
    );
  }

}
