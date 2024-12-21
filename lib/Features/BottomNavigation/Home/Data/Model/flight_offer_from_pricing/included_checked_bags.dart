class IncludedCheckedBags {
  int? quantity;
  int? weight;

  IncludedCheckedBags({this.quantity, this.weight});

  factory IncludedCheckedBags.fromJson(Map<String, dynamic> json) {
    return IncludedCheckedBags(
      quantity: json['quantity'] as int?,
      weight: json['weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'quantity': quantity,
        'weight': weight,
      };
}
