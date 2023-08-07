import 'dart:convert';

import 'package:schools/data/source/remote/model/parent_offline/parent_offline_data.dart';
import 'package:schools/data/source/remote/model/teacher_offline/teacher_offline_data.dart';

class ParentOfflineResponse {
  int? errorCode;
  String? errorMessage;
  ParentOfflineData? parentOfflineData;

  ParentOfflineResponse({
    this.errorCode,
    this.errorMessage,
    this.parentOfflineData,
  });

  ParentOfflineResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    parentOfflineData = json['data'] != null ?  ParentOfflineData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['errorCode'] = errorCode;
    data['errorMessage'] = errorMessage;
    if (parentOfflineData != null) {
      data['data'] = parentOfflineData!.toJson();
    }
    return data;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static ParentOfflineResponse fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return ParentOfflineResponse.fromJson(data);
  }
}
