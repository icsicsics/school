import 'student_profile_in_school_house.dart';

class TeacherStudentProfileInSchoolHouseResponse {
  int? errorCode;
  String? errorMessage;
  StudentProfileInSchoolHouseData? data;

  TeacherStudentProfileInSchoolHouseResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  TeacherStudentProfileInSchoolHouseResponse.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ? StudentProfileInSchoolHouseData.fromJson(json['data']) : null;
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
