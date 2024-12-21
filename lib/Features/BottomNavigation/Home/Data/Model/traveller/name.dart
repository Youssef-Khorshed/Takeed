class Name {
  String? firstName;
  String? lastName;

  Name({this.firstName, this.lastName});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
      };
}
