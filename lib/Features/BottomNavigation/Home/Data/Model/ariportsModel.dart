class Ariportsmodel {
  List<AirportData>? data;
  int? statusCode;
  bool? success;
  String? message;

  Ariportsmodel({this.data, this.statusCode, this.success, this.message});

  Ariportsmodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AirportData>[];
      json['data'].forEach((v) {
        data!.add(AirportData.fromJson(v));
      });
    }
    message = json['Message'];
    statusCode = json['statusCode'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = statusCode;
    data['success'] = success;
    return data;
  }
}

class AirportData {
  int? id;
  String? code;
  String? name;
  String? cityCode;
  String? cityName;
  String? countryCode;
  String? countryName;
  String? timezone;
  String? lat;
  String? lon;
  String? numAirports;
  bool? isCity;

  AirportData(
      {this.id,
      this.code,
      this.name,
      this.cityCode,
      this.cityName,
      this.countryCode,
      this.countryName,
      this.timezone,
      this.lat,
      this.lon,
      this.numAirports,
      this.isCity});

  AirportData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    cityCode = json['cityCode'];
    cityName = json['cityName'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    timezone = json['timezone'];
    lat = json['lat'];
    lon = json['lon'];
    numAirports = json['numAirports'];
    isCity = json['isCity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['cityCode'] = cityCode;
    data['cityName'] = cityName;
    data['countryCode'] = countryCode;
    data['countryName'] = countryName;
    data['timezone'] = timezone;
    data['lat'] = lat;
    data['lon'] = lon;
    data['numAirports'] = numAirports;
    data['isCity'] = isCity;
    return data;
  }
}
