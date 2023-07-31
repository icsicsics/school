import 'dart:convert';

import 'teacher_home_data.dart';

class GetTeacherHomeResponse {
  int? errorCode;
  String? errorMessage;
  TeacherHomeData ?data;
  GetTeacherHomeResponse({
      this.errorCode, 
      this.errorMessage, 
      this.data,});

  GetTeacherHomeResponse.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ? TeacherHomeData.fromJson(json['data']) : null;
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

  static GetTeacherHomeResponse fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return GetTeacherHomeResponse.fromJson(data);
  }

}