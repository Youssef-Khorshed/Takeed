import 'phone.dart';

class Contact {
  String? emailAddress;
  List<Phone>? phones;

  Contact({this.emailAddress, this.phones});

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        emailAddress: json['emailAddress'] as String?,
        phones: (json['phones'] as List<dynamic>?)
            ?.map((e) => Phone.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'emailAddress': emailAddress,
        'phones': phones?.map((e) => e.toJson()).toList(),
      };
}
