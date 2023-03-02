import 'package:last_exam/data/models/card_model/card_model.dart';

abstract class GetCardState {}

class InitialCardState extends GetCardState {}

class LoadCardInProgress extends GetCardState {}

class LoadCardInSuccess extends GetCardState {
  LoadCardInSuccess({required this.cardModel});

  final List<CardModel> cardModel;
}

class LoadCardInFailure extends GetCardState {
  LoadCardInFailure({required this.error});

  String error;
}
