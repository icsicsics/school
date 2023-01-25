class TeacherAddPointRequest {
  String? classroomSectionStudentsId;
  String? classroomToPrinciplesId;
  String? studentId;
  String? description;

  TeacherAddPointRequest({
    this.classroomSectionStudentsId,
    this.classroomToPrinciplesId,
    this.studentId,
    this.description,
  });

  TeacherAddPointRequest.fromJson(dynamic json) {
    classroomSectionStudentsId = json['classroomSectionStudentsId'];
    classroomToPrinciplesId = json['classroomToPrinciplesId'];
    studentId = json['studentId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['classroomSectionStudentsId'] = classroomSectionStudentsId;
    map['classroomToPrinciplesId'] = classroomToPrinciplesId;
    map['studentId'] = studentId;
    map['description'] = description;
    return map;
  }
}
