import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_pay/data/models/user_model.dart';
import 'package:fast_pay/utils/connstants/app_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/network_response.dart';

class UserProfileRepository {
  Future<NetworkResponse> addUser(UserModel userModel) async {
    debugPrint("Keldi--------");
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(AppConstants.users).get();
      List<UserModel> users = querySnapshot.docs
          .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      User? user = FirebaseAuth.instance.currentUser;
      String uuId = "";

      if (user != null) {
        uuId = user.uid;
      }

      bool isExist = false;
      for (var user in users) {
        if (user.email == userModel.email) {
          debugPrint("Bunaqasi bor:( --------");

          isExist = true;
          break;
        }
      }
      if (!isExist) {
        debugPrint("QueryOky asds ads bor:( --------");

        DocumentReference documentReference = await FirebaseFirestore.instance
            .collection(AppConstants.users)
            .add(userModel.toJson());

        await FirebaseFirestore.instance
            .collection(AppConstants.users)
            .doc(documentReference.id)
            .update({"userId": documentReference.id, "authId": uuId});
      }
      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      debugPrint("user add error: $error");
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> updateUser(UserModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.users)
          .doc(userModel.userId)
          .update(userModel.toJsonForUpdate());
      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      debugPrint("user add error: $error");
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> deleteUser(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.users)
          .doc(docId)
          .delete();
      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      debugPrint("user add error: $error");
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> getUserByDocId(String docId) async {
    try {
      print("user by docid @@@@@@@@@@@");
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.users)
          .doc(docId)
          .get();
      return NetworkResponse(
        data: UserModel.fromJson(
          documentSnapshot.data() as Map<String, dynamic>,
        ),
      );
    } on FirebaseException catch (error) {
      debugPrint("user add error: $error");
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> getUserByUid() async {
    try {
      // User? user = FirebaseAuth.instance.currentUser;
      // String uuId = "";
      //
      // if (user != null) {
      //   uuId = user.uid;
      // }
      print("user by uid@@@@@@");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.users)
          .where("authUid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      List<UserModel> users = querySnapshot.docs
          .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      return NetworkResponse(
          data: users.isEmpty ? UserModel.initial() : users.first);
    } on FirebaseException catch (error) {
      debugPrint("user add error: $error");
      return NetworkResponse(errorCode: error.code);
    }
  }
}
