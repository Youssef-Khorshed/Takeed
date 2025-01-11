class TravelerRequirement {
  String? travelerId;
  bool? genderRequired;
  bool? documentRequired;
  bool? documentIssuanceCityRequired;
  bool? dateOfBirthRequired;
  bool? redressRequiredIfAny;
  bool? airFranceDiscountRequired;
  bool? spanishResidentDiscountRequired;
  bool? residenceRequired;

  TravelerRequirement({
    this.travelerId,
    this.genderRequired,
    this.documentRequired,
    this.documentIssuanceCityRequired,
    this.dateOfBirthRequired,
    this.redressRequiredIfAny,
    this.airFranceDiscountRequired,
    this.spanishResidentDiscountRequired,
    this.residenceRequired,
  });

  factory TravelerRequirement.fromJson(Map<String, dynamic> json) {
    return TravelerRequirement(
      travelerId: json['travelerId'] as String?,
      genderRequired: json['genderRequired'] as bool?,
      documentRequired: json['documentRequired'] as bool?,
      documentIssuanceCityRequired:
          json['documentIssuanceCityRequired'] as bool?,
      dateOfBirthRequired: json['dateOfBirthRequired'] as bool?,
      redressRequiredIfAny: json['redressRequiredIfAny'] as bool?,
      airFranceDiscountRequired: json['airFranceDiscountRequired'] as bool?,
      spanishResidentDiscountRequired:
          json['spanishResidentDiscountRequired'] as bool?,
      residenceRequired: json['residenceRequired'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'travelerId': travelerId,
        'genderRequired': genderRequired,
        'documentRequired': documentRequired,
        'documentIssuanceCityRequired': documentIssuanceCityRequired,
        'dateOfBirthRequired': dateOfBirthRequired,
        'redressRequiredIfAny': redressRequiredIfAny,
        'airFranceDiscountRequired': airFranceDiscountRequired,
        'spanishResidentDiscountRequired': spanishResidentDiscountRequired,
        'residenceRequired': residenceRequired,
      };
}
