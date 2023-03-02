import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:last_exam/data/repositories/card_repository.dart';

final getIt = GetIt.instance;
var fireStore = FirebaseFirestore.instance;

void setup() {
  getIt.registerLazySingleton(
      () => CardRepository(firebaseFirestore: fireStore));
}
