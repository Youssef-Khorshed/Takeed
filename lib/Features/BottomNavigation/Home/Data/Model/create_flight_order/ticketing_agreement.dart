class TicketingAgreement {
  String? option;
  String? delay;

  TicketingAgreement({this.option, this.delay});

  factory TicketingAgreement.fromJson(Map<String, dynamic> json) {
    return TicketingAgreement(
      option: json['option'] as String?,
      delay: json['delay'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'option': option,
        'delay': delay,
      };
}
