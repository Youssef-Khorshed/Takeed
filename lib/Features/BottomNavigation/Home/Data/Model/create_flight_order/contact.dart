import 'phone.dart';

class Contact {
  String? purpose;
  List<Phone>? phones;
  String? emailAddress;

  Contact({this.purpose, this.phones, this.emailAddress});

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        purpose: json['purpose'] as String?,
        phones: (json['phones'] as List<dynamic>?)
            ?.map((e) => Phone.fromJson(e as Map<String, dynamic>))
            .toList(),
        emailAddress: json['emailAddress'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'purpose': purpose,
        'phones': phones?.map((e) => e.toJson()).toList(),
        'emailAddress': emailAddress,
      };
}
