import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_exam/cubit/get_cards/get_card_state.dart';
import 'package:last_exam/data/network/get_it/get_it.dart';
import 'package:last_exam/data/repositories/card_repository.dart';

class GetCardCubit extends Cubit<GetCardState> {
  GetCardCubit() : super(InitialCardState()) {
    fetchCards();
  }

  fetchCards() async {
    emit(LoadCardInProgress());
    getIt.get<CardRepository>().getCards().listen((cards) {
      emit(LoadCardInSuccess(cardModel: cards));
    });
  }
}
