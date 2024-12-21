class AssociatedRecord {
  String? reference;
  String? creationDate;
  String? originSystemCode;
  String? flightOfferId;

  AssociatedRecord({
    this.reference,
    this.creationDate,
    this.originSystemCode,
    this.flightOfferId,
  });

  factory AssociatedRecord.fromJson(Map<String, dynamic> json) {
    return AssociatedRecord(
      reference: json['reference'] as String?,
      creationDate: json['creationDate'] as String?,
      originSystemCode: json['originSystemCode'] as String?,
      flightOfferId: json['flightOfferId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'reference': reference,
        'creationDate': creationDate,
        'originSystemCode': originSystemCode,
        'flightOfferId': flightOfferId,
      };
}
