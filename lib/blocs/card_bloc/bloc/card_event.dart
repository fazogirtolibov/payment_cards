part of 'card_bloc.dart';

abstract class CardEvent {}

class AddCard extends CardEvent {
  AddCard({required this.cardModel});

  final CardModel cardModel;
}

class UpdateCard extends CardEvent {
  final String docId;
  final String color;
  final String cardHolder;
  UpdateCard(
      {required this.docId, required this.color, required this.cardHolder});
}

class DeleteCard extends CardEvent {
  DeleteCard({required this.docId});

  final String docId;
}
