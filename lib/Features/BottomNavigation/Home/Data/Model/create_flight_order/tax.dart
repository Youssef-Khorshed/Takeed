class Tax {
  String? amount;
  String? code;

  Tax({this.amount, this.code});

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        amount: json['amount'] as String?,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'code': code,
      };
}
