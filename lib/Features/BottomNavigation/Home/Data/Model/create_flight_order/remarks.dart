import 'general.dart';

class Remarks {
  List<General>? general;

  Remarks({this.general});

  factory Remarks.fromJson(Map<String, dynamic> json) => Remarks(
        general: (json['general'] as List<dynamic>?)
            ?.map((e) => General.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'general': general?.map((e) => e.toJson()).toList(),
      };
}
