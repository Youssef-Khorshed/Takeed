class PricingOptions {
  bool? includedCheckedBagsOnly;
  List<String>? fareType;
  bool? refundableFare;
  bool? noRestrictionFare;
  bool? noPenaltyFare;

  PricingOptions({
    this.includedCheckedBagsOnly,
    this.fareType,
    this.refundableFare,
    this.noRestrictionFare,
    this.noPenaltyFare,
  });

  factory PricingOptions.fromJson(Map<String, dynamic> json) {
    return PricingOptions(
      includedCheckedBagsOnly: json['includedCheckedBagsOnly'] as bool?,
      fareType: (json['fareType'] as List<dynamic>?)
          ?.map((toElement) => toElement as String)
          .toList(),
      refundableFare: json['refundableFare'] as bool?,
      noRestrictionFare: json['noRestrictionFare'] as bool?,
      noPenaltyFare: json['noPenaltyFare'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'includedCheckedBagsOnly': includedCheckedBagsOnly,
        'fareType': fareType,
        'refundableFare': refundableFare,
        'noRestrictionFare': noRestrictionFare,
        'noPenaltyFare': noPenaltyFare,
      };
}
