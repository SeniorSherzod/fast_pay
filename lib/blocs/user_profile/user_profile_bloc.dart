import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_pay/data/models/forms_status.dart';
import 'package:fast_pay/data/models/user_model.dart';
import 'package:fast_pay/data/repositories/user_profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../data/models/network_response.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc(this.userProfileRepository)
      : super(UserProfileState(
          status: FormsStatus.pure,
          userModel: UserModel.initial(),
          statusMessage: "",
          errorMessage: "",
        )) {
    on<AddUserEvent>(_addUser);
    on<UpdateUserEvent>(_updateUser);
    on<DeleteUserEvent>(_deleteUser);
    on<GetUserByDocIdEvent>(_getUserByDocId);
    on<GetCurrentEvent>(_getCurrentUser);
  }

  final UserProfileRepository userProfileRepository;

  _addUser(AddUserEvent event, Emitter<UserProfileState> emit) async {
    NetworkResponse networkResponse =
        await userProfileRepository.addUser(event.userModel);
    if (networkResponse.errorText.isEmpty) {
      debugPrint("Saqlandi ---------");

      emit(state.copyWith(status: FormsStatus.authenticated));
    } else {
      debugPrint("Error :(--------");
      emit(
        state.copyWith(
          errorMessage: networkResponse.errorText,
          status: FormsStatus.error,
        ),
      );
    }
  }

  _updateUser(UpdateUserEvent event, Emitter<UserProfileState> emit) async {
    NetworkResponse networkResponse =
        await userProfileRepository.updateUser(event.userModel);
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          errorMessage: networkResponse.errorText,
          status: FormsStatus.error,
        ),
      );
    }
  }

  _deleteUser(DeleteUserEvent event, Emitter<UserProfileState> emit) async {
    NetworkResponse networkResponse =
        await userProfileRepository.deleteUser(event.userModel.userId);
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          errorMessage: networkResponse.errorText,
          status: FormsStatus.error,
        ),
      );
    }
  }

  _getUserByDocId(
      GetUserByDocIdEvent event, Emitter<UserProfileState> emit) async {
    NetworkResponse networkResponse =
        await userProfileRepository.getUserByDocId(event.docId);
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          errorMessage: networkResponse.errorText,
          status: FormsStatus.error,
        ),
      );
    }
  }

  _getCurrentUser(GetCurrentEvent event, Emitter<UserProfileState> emit) async {
    NetworkResponse networkResponse =
        await userProfileRepository.getUserByUid();
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.authenticated,
          userModel: networkResponse.data as UserModel,
          statusMessage: "User Info"));
    } else {
      emit(
        state.copyWith(
          userModel: networkResponse.data,
          errorMessage: networkResponse.errorText,
          status: FormsStatus.error,
        ),
      );
    }
  }
}
