class Address {
  List<String>? lines;
  String? postalCode;
  String? countryCode;
  String? cityName;
  String? stateName;

  Address({
    this.lines,
    this.postalCode,
    this.countryCode,
    this.cityName,
    this.stateName,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        lines: json['lines'] as List<String>?,
        postalCode: json['postalCode'] as String?,
        countryCode: json['countryCode'] as String?,
        cityName: json['cityName'] as String?,
        stateName: json['stateName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'lines': lines,
        'postalCode': postalCode,
        'countryCode': countryCode,
        'cityName': cityName,
        'stateName': stateName,
      };
}
