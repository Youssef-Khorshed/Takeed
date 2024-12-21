class Document {
  String? documentType;
  String? birthPlace;
  String? issuanceLocation;
  String? issuanceDate;
  String? number;
  String? expiryDate;
  String? issuanceCountry;
  String? validityCountry;
  String? nationality;
  bool? holder;

  Document({
    this.documentType,
    this.birthPlace,
    this.issuanceLocation,
    this.issuanceDate,
    this.number,
    this.expiryDate,
    this.issuanceCountry,
    this.validityCountry,
    this.nationality,
    this.holder,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        documentType: json['documentType'] as String?,
        birthPlace: json['birthPlace'] as String?,
        issuanceLocation: json['issuanceLocation'] as String?,
        issuanceDate: json['issuanceDate'] as String?,
        number: json['number'] as String?,
        expiryDate: json['expiryDate'] as String?,
        issuanceCountry: json['issuanceCountry'] as String?,
        validityCountry: json['validityCountry'] as String?,
        nationality: json['nationality'] as String?,
        holder: json['holder'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'documentType': documentType,
        'birthPlace': birthPlace,
        'issuanceLocation': issuanceLocation,
        'issuanceDate': issuanceDate,
        'number': number,
        'expiryDate': expiryDate,
        'issuanceCountry': issuanceCountry,
        'validityCountry': validityCountry,
        'nationality': nationality,
        'holder': holder,
      };
}
