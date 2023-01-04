import 'data.dart';

class TeacherInfoResponse {
  int? errorCode;
  String? errorMessage;
  Data? data;

  TeacherInfoResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  TeacherInfoResponse.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
}
