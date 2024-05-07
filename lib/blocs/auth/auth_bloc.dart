import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_pay/data/models/network_response.dart';
import 'package:fast_pay/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/models/forms_status.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_profile_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository})
      : super(AuthState.init()) {
    on<CheckAuthenticationEvent>(_checkAuthentication);
    on<LoginUserEvent>(_loginUser);
    on<LogOutUserEvent>(_logOutUser);
    on<RegisterUserEvent>(_registerUser);
    on<SignInWithGoogleEvent>(_googleSignIn);
  }

  final AuthRepository authRepository;
  _checkAuthentication(CheckAuthenticationEvent event, emit) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      emit(state.copyWith(status: FormsStatus.unauthenticated));
    } else {
      emit(state.copyWith(status: FormsStatus.authenticated));
    }
  }

  _loginUser(LoginUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse =
        await authRepository.logInWithEmailAndPassword(
            email: event.username,
            password: event.password);
    if (networkResponse.errorText.isEmpty) {
      UserCredential userCredential =networkResponse.data as UserCredential;

      UserModel userModel =state.userModel.copyWith(authId: userCredential.user!.uid);

      emit(state.copyWith(
        status: FormsStatus.authenticated,
        userModel: userModel,
      ));
    } else {
      emit(
        state.copyWith(
            status: FormsStatus.error,
            statusMessage: networkResponse.errorText),
      );
    }
  }

  _registerUser(RegisterUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse =
    await authRepository.registerWithEmailAndPassword(
        email: event.userModel.email,
        password: event.userModel.password);
    if (networkResponse.errorText.isEmpty) {
      UserCredential userCredential = networkResponse.data as UserCredential;
      UserModel userModel = event.userModel.copyWith(
        authId: userCredential.user!.uid,
      );
    emit(
      state.copyWith(
          status: FormsStatus.authenticated,
          statusMessage: "registered",
          userModel: userModel
      ),
    );
  }
    else {
      debugPrint("Error register user!!${networkResponse.errorCode}");
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  _logOutUser(LogOutUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    await authRepository.logOutUser();
    // NetworkResponse networkResponse = await authRepository.logOutUser();
    // if (networkResponse.errorText.isEmpty) {
    //   emit(state.copyWith(
    //     status: FormsStatus.authenticated,
    //   ));
    // } else {
    //   emit(
    //     state.copyWith(
    //         status: FormsStatus.error,
    //         statusMessage: networkResponse.errorText),
    //   );
    // }
  }

  _googleSignIn(SignInWithGoogleEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse = await authRepository.googleSignIn();
    if (networkResponse.errorText.isEmpty) {
      UserCredential userCredential = networkResponse.data;
      emit(state.copyWith(
        statusMessage: "registered",
          status: FormsStatus.authenticated,
          userModel: UserModel(
              image: userCredential.user!.photoURL ?? "",
              userId: "",
              lastname: userCredential.user!.displayName ?? "",
              username: userCredential.user!.displayName ?? "",
              password: "",
              email: userCredential.user!.email ?? "",
              phoneNumber: userCredential.user!.phoneNumber ?? "",
              authId: userCredential.user!.uid,
              fsm: "")));
    } else {
      emit(
        state.copyWith(
            status: FormsStatus.error,
            statusMessage: networkResponse.errorText),
      );
    }
  }

}
