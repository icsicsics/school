import 'dart:convert';

class Guide {
  String? guideId;
  String? guideName;
  bool? isSelected;

  Guide({
    this.guideId,
    this.guideName,
    this.isSelected,
  });

  Guide.fromJson(Map<String, dynamic> json) {
    guideId = json['guideId'];
    guideName = json['guideName'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guideId'] = this.guideId;
    data['guideName'] = this.guideName;
    return data;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static Guide fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return Guide.fromJson(data);
  }
}
