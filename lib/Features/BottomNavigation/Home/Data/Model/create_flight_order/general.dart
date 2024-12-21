class General {
  String? subType;
  String? text;

  General({this.subType, this.text});

  factory General.fromJson(Map<String, dynamic> json) => General(
        subType: json['subType'] as String?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'subType': subType,
        'text': text,
      };
}
