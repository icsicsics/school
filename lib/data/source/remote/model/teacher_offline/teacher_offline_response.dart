import 'dart:convert';

import 'package:schools/data/source/remote/model/teacher_offline/teacher_offline_data.dart';

class TeacherOfflineResponse {
  int? errorCode;
  String? errorMessage;
  TeacherOfflineData? teacherOfflineData;

  TeacherOfflineResponse({
    this.errorCode,
    this.errorMessage,
    this.teacherOfflineData,
  });

  TeacherOfflineResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    teacherOfflineData = json['data'] != null ?  TeacherOfflineData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['errorCode'] = errorCode;
    data['errorMessage'] = errorMessage;
    if (teacherOfflineData != null) {
      data['data'] = teacherOfflineData!.toJson();
    }
    return data;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static TeacherOfflineResponse fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return TeacherOfflineResponse.fromJson(data);
  }
}
