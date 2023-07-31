import 'dart:convert';

class Coord {
  double? lon;
  double? lat;

  Coord({
    this.lon,
    this.lat,
  });

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }


  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static Coord fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return Coord.fromJson(data);
  }
}
