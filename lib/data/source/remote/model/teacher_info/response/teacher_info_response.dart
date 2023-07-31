import 'dart:convert';

import 'teacher_info_data.dart';

class TeacherInfoResponse {
  int? errorCode;
  String? errorMessage;
  TeacherInfoData? data;

  TeacherInfoResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  TeacherInfoResponse.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ? TeacherInfoData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorCode'] = errorCode;
    map['errorMessage'] = errorMessage;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static TeacherInfoResponse fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return TeacherInfoResponse.fromJson(data);
  }
}
