part of 'card_bloc.dart';

class CardState extends Equatable {
  final MyStatus status;
  final String statusText;

  CardState({required this.status, required this.statusText});

  CardState copyWith(
          {MyStatus? status, String? statusText, CardModel? cardModel}) =>
      CardState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
      );

  @override
  List<dynamic> get props => [
        status,
        statusText,
      ];
}

enum MyStatus {
  loading,
  pure,
  contactAdded,
  contactUpdate,
  contactDelete,
}
