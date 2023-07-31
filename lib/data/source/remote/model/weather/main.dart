import 'dart:convert';

class Main {
  double? temp;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    return map;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static Main fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return Main.fromJson(data);
  }
}
