// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:last_exam/data/models/card_model/card_model.dart';
import 'package:last_exam/data/network/get_it/get_it.dart';

import '../../../data/repositories/card_repository.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardState(status: MyStatus.pure, statusText: '')) {
    on<AddCard>(_addCard);
    on<UpdateCard>(_updateCard);
    on<DeleteCard>(_deleteCard);
  }

  _addCard(AddCard event, Emitter<CardState> emit) async {
    emit(state.copyWith(status: MyStatus.loading));
    getIt.get<CardRepository>().addCard(cardModel: event.cardModel);
    emit(state.copyWith(status: MyStatus.contactAdded));
  }

  _updateCard(UpdateCard event, Emitter<CardState> emit) async {
    emit(state.copyWith(status: MyStatus.loading));
    getIt.get<CardRepository>().updateCard(
          cardHolder: event.cardHolder,
          color: event.color,
          docId: event.docId,
        );
    emit(state.copyWith(status: MyStatus.contactUpdate));
  }

  _deleteCard(DeleteCard event, Emitter<CardState> emit) async {
    emit(state.copyWith(status: MyStatus.loading));
    getIt.get<CardRepository>().deleteCard(docId: event.docId);
    emit(state.copyWith(status: MyStatus.contactDelete));
  }
}
