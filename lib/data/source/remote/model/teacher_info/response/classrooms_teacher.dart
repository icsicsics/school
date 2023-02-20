class ClassroomsTeacher {
  String? classroomToSectionId;
  String? classroomName;
  String? sectionName;

  ClassroomsTeacher({
    this.classroomToSectionId,
    this.classroomName,
    this.sectionName,
  });

  ClassroomsTeacher.fromJson(dynamic json) {
    classroomToSectionId = json['classroomToSectionId'];
    classroomName = json['classroomName'];
    sectionName = json['sectionName'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['classroomToSectionId'] = classroomToSectionId;
    map['classroomName'] = classroomName;
    map['sectionName'] = sectionName;
    return map;
  }
}
