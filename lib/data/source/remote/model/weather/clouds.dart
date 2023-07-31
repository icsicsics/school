import 'dart:convert';

class Clouds {
  int? all;

  Clouds({
    this.all,
  });

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static Clouds fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return Clouds.fromJson(data);
  }
}
