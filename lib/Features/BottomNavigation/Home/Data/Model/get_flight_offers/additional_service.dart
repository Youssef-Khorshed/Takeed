class AdditionalService {
  String? type;
  double? amount;

  AdditionalService({this.type, this.amount});

  factory AdditionalService.fromJson(Map<String, dynamic> json) {
    return AdditionalService(
      type: json['type'] as String?,
      amount: json['amount'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'amount': amount,
      };
}
