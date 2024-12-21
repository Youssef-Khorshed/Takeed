class AddresseeName {
  String? firstName;

  AddresseeName({this.firstName});

  factory AddresseeName.fromJson(Map<String, dynamic> json) => AddresseeName(
        firstName: json['firstName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
      };
}
