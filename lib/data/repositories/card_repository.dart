import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:last_exam/data/models/card_model/card_model.dart';
import 'package:last_exam/utils/my_utils.dart';

class CardRepository {
  final FirebaseFirestore _firestore;
  CardRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addCard({required CardModel cardModel}) async {
    try {
      DocumentReference newCard =
          await _firestore.collection("cards").add(cardModel.toJson());
      await _firestore
          .collection("cards")
          .doc(newCard.id)
          .update({"id": newCard.id});
      MyUtils.getMyToast(message: 'Card successfully added');
    } on FirebaseException catch (e) {
      MyUtils.getMyToast(message: e.message.toString());
    }
  }

  Future<void> deleteCard({required String docId}) async {
    try {
      await _firestore.collection("cards").doc(docId).delete();
      MyUtils.getMyToast(message: "Deleted!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> updateCard({
    required var color,
    required String docId,
    required String cardHolder,
  }) async {
    try {
      await _firestore.collection("cards").doc(docId).update({
        "color": color,
        "card_holder": cardHolder,
      });
      MyUtils.getMyToast(message: "Updated!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Stream<List<CardModel>> getCards() =>
      _firestore.collection("cards").snapshots().map((querySnapshot) =>
          querySnapshot.docs.map((e) => CardModel.fromJson(e.data())).toList());
}
