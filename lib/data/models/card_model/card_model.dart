class CardModel {
  String id;
  String cardType;
  String cardNumber;
  String expireDate;
  String iconImage;
  String cardHolder;
  String color;

  CardModel({
    required this.id,
    required this.cardType,
    required this.cardNumber,
    required this.expireDate,
    required this.iconImage,
    required this.cardHolder,
    required this.color,
  });

  factory CardModel.fromJson(Map<String, dynamic> jsonData) {
    return CardModel(
      id: jsonData['id'] as String? ?? '',
      cardType: jsonData['card_type'] as String? ?? '',
      cardNumber: jsonData['card_number'] as String? ?? '',
      expireDate: jsonData['expire_date'] as String? ?? '',
      iconImage: jsonData['icon_image'] as String? ?? '',
      cardHolder: jsonData['card_holder'] as String? ?? '',
      color: jsonData['color'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'card_type': cardType,
      'card_number': cardNumber,
      'expire_date': expireDate,
      'icon_image': iconImage,
      'card_holder': cardHolder,
      'color': color,
    };
  }

  CardModel copyWith({
    String? id,
    String? cardType,
    String? cardNumber,
    String? bankName,
    String? expireDate,
    String? iconImage,
    String? color,
    String? cardHolder,
  }) =>
      CardModel(
        id: id ?? this.id,
        cardType: cardType ?? this.cardType,
        cardNumber: cardNumber ?? this.cardNumber,
        expireDate: expireDate ?? this.expireDate,
        iconImage: iconImage ?? this.iconImage,
        color: color ?? this.color,
        cardHolder: cardHolder ?? this.cardHolder,
      );
}
