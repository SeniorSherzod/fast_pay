class CardModel {
  final String cardHolder;
  final String cardNumber;
  final String expireDate;
  final String userId;
  final int type;
  final String cvc;
  final String icon;
  final double balance;
  final String bank;
  final String cardId;
  final String color;
  final bool isMain;

  CardModel(
      {required this.cardId,
        required this.userId,
        required this.cardHolder,
        required this.cardNumber,
        required this.balance,
        required this.bank,
        required this.type,
        required this.icon,
        required this.expireDate,
        required this.cvc,
        required this.color,
        required this.isMain
      });

  CardModel copyWith({
    String? cardHolder,
    String? cardNumber,
    String? expireDate,
    String? userId,
    int? type,
    String? cvc,
    String? icon,
    String? bank,
    String? cardId,
    String? color,
    double? balance,
    bool? isMain
  }) {
    return CardModel(
        userId: userId ?? this.userId,
        balance: balance ?? this.balance,
        cardId: cardId ?? this.cardId,
        bank: bank ?? this.bank,
        cardHolder: cardHolder ?? this.cardHolder,
        cardNumber: cardNumber ?? this.cardNumber,
        expireDate: expireDate ?? this.expireDate,
        cvc: cvc ?? this.cvc,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        isMain: isMain ?? this.isMain,
        type: type ?? this.type);
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "balance": balance,
    "cardId": cardId,
    "bank": bank,
    "cardHolder": cardHolder,
    "cardNumber": cardNumber,
    "expireDate": expireDate,
    "cvc": cvc,
    "icon": icon,
    "type": type,
    "color": color,
    "isMain": isMain
  };

  Map<String, dynamic> toJsonForUpdate() => {
    "balance": balance,
    "bank": bank,
    "color": color,
    "isMain": isMain
  };
  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      cardHolder: json["cardHolder"] as String? ?? "",
      cardNumber: json["cardNumber"] as String? ?? "",
      expireDate: json["expireDate"] as String? ?? "",
      userId: json["userId"] as String? ?? "",
      type: json["type"] as int? ?? 0,
      cvc: json["cvc"] as String? ?? "",
      icon: json["icon"] as String? ?? "",
      balance: (json["balance"] as num? ?? 0).toDouble(),
      bank: json["bank"] as String? ?? "",
      cardId: json["cardId"] as String? ?? "",
      color: json["color"] as String? ?? "",
      isMain: json["isMain"] as bool? ?? false,
    );
  }

  // Factory method to create an initial CardModel instance
  static CardModel initial() => CardModel(
    cardHolder: "",
    cardNumber: "",
    expireDate: "",
    userId: "",
    type: 0,
    cvc: "",
    icon: "",
    balance: 0.0,
    bank: "",
    cardId: "",
    color: "",
    isMain: false
  );
}
