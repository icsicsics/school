import 'dart:convert';

class Wind {
  double? speed;
  int? deg;

  Wind({
    this.speed,
    this.deg,
  });

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static Wind fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return Wind.fromJson(data);
  }
}
