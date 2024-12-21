import 'other.dart';

class FormOfPayment {
  Other? other;

  FormOfPayment({this.other});

  factory FormOfPayment.fromJson(Map<String, dynamic> json) => FormOfPayment(
        other: json['other'] == null
            ? null
            : Other.fromJson(json['other'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'other': other?.toJson(),
      };
}
