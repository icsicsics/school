class Students {
  String? studentId;
  String? classroomToSectionId;
  String? studentName;
  dynamic getImage;

  Students({
    this.studentId,
    this.classroomToSectionId,
    this.studentName,
    this.getImage,
  });

  Students.fromJson(dynamic json) {
    studentId = json['studentId'];
    classroomToSectionId = json['classroomToSectionId'];
    studentName = json['studentName'];
    getImage = json['getImage'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['studentId'] = studentId;
    map['classroomToSectionId'] = classroomToSectionId;
    map['studentName'] = studentName;
    map['getImage'] = getImage;
    return map;
  }
}
