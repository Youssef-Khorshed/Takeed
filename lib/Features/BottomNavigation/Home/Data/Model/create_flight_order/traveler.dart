import 'contact.dart';
import 'name.dart';

class Traveler {
  String? id;
  String? dateOfBirth;
  String? gender;
  Name? name;
  Contact? contact;

  Traveler({
    this.id,
    this.dateOfBirth,
    this.gender,
    this.name,
    this.contact,
  });

  factory Traveler.fromJson(Map<String, dynamic> json) => Traveler(
        id: json['id'] as String?,
        dateOfBirth: json['dateOfBirth'] as String?,
        gender: json['gender'] as String?,
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        contact: json['contact'] == null
            ? null
            : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'name': name?.toJson(),
        'contact': contact?.toJson(),
      };
}
