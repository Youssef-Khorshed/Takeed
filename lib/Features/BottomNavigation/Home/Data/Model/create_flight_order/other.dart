class Other {
  String? method;
  List<String>? flightOfferIds;

  Other({this.method, this.flightOfferIds});

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        method: json['method'] as String?,
        flightOfferIds: (json['flightOfferIds'] as List<dynamic>?)
            ?.map((toElement) => toElement.toString())
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'method': method,
        'flightOfferIds': flightOfferIds,
      };
}
