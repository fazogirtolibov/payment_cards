import 'package:flutter_bloc/flutter_bloc.dart';

class TabboxCubit extends Cubit<int> {
  TabboxCubit() : super(0);
  int activePageIndex = 0;

  void changePageIndex(int newIndex) {
    emit(activePageIndex = newIndex);
  }
}
