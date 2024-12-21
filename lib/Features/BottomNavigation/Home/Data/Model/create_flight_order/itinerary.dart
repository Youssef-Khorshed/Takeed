import 'segment.dart';

class Itinerary {
  List<Segment>? segments;

  Itinerary({this.segments});

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        segments: (json['segments'] as List<dynamic>?)
            ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'segments': segments?.map((e) => e.toJson()).toList(),
      };
}
