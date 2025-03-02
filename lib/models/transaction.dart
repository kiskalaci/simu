class Transaction {
  Transaction({
    this.id,
    this.userId,
    this.date,
    this.merchant,
    this.amount,
    this.currency,
    this.description,
    this.fromAccount,
    this.toAccount,
    this.category,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    date = json["date"];
    merchant = json["merchant"];
    amount =
        json["amount"] != null
            ? double.tryParse(json["amount"].toString())
            : null;
    currency = json["currency"];
    description = json["description"];
    fromAccount = json["from_account"];
    toAccount = json["to_account"];
    category = json["category"];
  }
  int? id;
  int? userId;
  String? date;
  String? merchant;
  double? amount;
  String? currency;
  String? description;
  String? fromAccount;
  String? toAccount;
  String? category;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["userId"] = userId;
    data["date"] = date;
    data["merchant"] = merchant;
    data["amount"] = amount;
    data["currency"] = currency;
    data["description"] = description;
    data["from_account"] = fromAccount;
    data["to_account"] = toAccount;
    data["category"] = category;
    return data;
  }
}
