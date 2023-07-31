import 'teacher_principle_data.dart';

class GetTeacherPrinciplByClassroomIdResponse {
  int? errorCode;
  String? errorMessage;
  List<TeacherPrincipleData>? data;

  GetTeacherPrinciplByClassroomIdResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  GetTeacherPrinciplByClassroomIdResponse.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(TeacherPrincipleData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorCode'] = errorCode;
    map['errorMessage'] = errorMessage;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
