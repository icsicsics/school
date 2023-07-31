import 'dart:convert';

class Advisor {
  String? reportName;
  String? description;
  String? advisorName;

  Advisor({
    this.reportName,
    this.description,
    this.advisorName,
  });

  Advisor.fromJson(Map<String, dynamic> json) {
    reportName = json['reportName'];
    description = json['description'];
    advisorName = json['advisorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reportName'] = this.reportName;
    data['description'] = this.description;
    data['advisorName'] = this.advisorName;
    return data;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static Advisor fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return Advisor.fromJson(data);
  }
}
