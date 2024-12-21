class Phone {
  String? deviceType;
  String? countryCallingCode;
  String? number;

  Phone({this.deviceType, this.countryCallingCode, this.number});

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        deviceType: json['deviceType'] as String?,
        countryCallingCode: json['countryCallingCode'] as String?,
        number: json['number'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'deviceType': deviceType,
        'countryCallingCode': countryCallingCode,
        'number': number,
      };
}
