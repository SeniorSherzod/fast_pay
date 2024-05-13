import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/connstants/app_const.dart';
import '../models/cards_model.dart';
import '../models/network_response.dart';

class CardsRepository {
  Future<NetworkResponse> addCard(CardModel cardModel) async {
    try {
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection(AppConstants.cards)
          .add(cardModel.toJson());
      await FirebaseFirestore.instance
          .collection(AppConstants.cards)
          .doc(documentReference.id)
          .update({"cardId": documentReference.id});
      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      debugPrint("CARD ADD ERROR: $error");
      return NetworkResponse(errorText: error.toString());
    }
  }

  Future<NetworkResponse> updateCard(CardModel cardModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.cards)
          .doc(cardModel.cardId)
          .update(cardModel.toJsonForUpdate());
      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Future<NetworkResponse> deleteCard(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.cards)
          .doc(docId)
          .delete();
      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Stream<List<CardModel>> getCardsByUserId(String userId) {
    return FirebaseFirestore.instance
        .collection(AppConstants.cards)
        .where("userId", isEqualTo: userId)
        .snapshots()
        .map((event) =>
            event.docs.map((doc) => CardModel.fromJson(doc.data())).toList());
  }

  Stream<List<CardModel>> getCardsDatabase() {
    return FirebaseFirestore.instance
        .collection(AppConstants.cardsDatabase)
        .snapshots()
        .map((event) =>
            event.docs.map((doc) => CardModel.fromJson(doc.data())).toList());
  }
  Stream<List<CardModel>> getActiveCards() => FirebaseFirestore.instance
      .collection(AppConstants.cards)
      .snapshots()
      .map((event) =>
      event.docs.map((doc) => CardModel.fromJson(doc.data())).toList());
}
