import 'contact.dart';
//import 'document.dart';
import 'name.dart';

class Traveller {
  String? id;
  String? dateOfBirth;
  Name? name;
  String? gender;
  Contact? contact;
  //List<Document>? documents;

  Traveller({
    this.id,
    this.dateOfBirth,
    this.name,
    this.gender,
    this.contact,
    // this.documents,
  });

  factory Traveller.fromJson(Map<String, dynamic> json) => Traveller(
        id: json['id'] as String?,
        dateOfBirth: json['dateOfBirth'] as String?,
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        gender: json['gender'] as String?,
        contact: json['contact'] == null
            ? null
            : Contact.fromJson(json['contact'] as Map<String, dynamic>),
        // documents: (json['documents'] as List<dynamic>?)
        //     ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
        //     .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'dateOfBirth': dateOfBirth,
        'name': name?.toJson(),
        'gender': gender,
        'contact': contact?.toJson(),
        //  'documents': documents?.map((e) => e.toJson()).toList(),
      };
}
