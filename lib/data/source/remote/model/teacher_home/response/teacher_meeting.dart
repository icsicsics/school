import 'dart:convert';

class TeacherMeeting {
  String? id;
  String? guideId;
  String? teacherId;
  String? studentId;
  String? classroomToSectionId;
  String? studentName;
  String? parentPhone;
  String? parentName;
  String? teacherName;
  String? classroomToSectionName;
  String? meetingTime;
  String? meetingTimeStr;
  String? status;
  int? isAccepted;
  bool? isforStudent;
  String? createdBy;
  String? modifiedBy;
  String? creationDate;

  TeacherMeeting({
    this.id,
    this.guideId,
    this.teacherId,
    this.studentId,
    this.classroomToSectionId,
    this.studentName,
    this.parentPhone,
    this.parentName,
    this.teacherName,
    this.classroomToSectionName,
    this.meetingTime,
    this.meetingTimeStr,
    this.status,
    this.isAccepted,
    this.isforStudent,
    this.createdBy,
    this.modifiedBy,
    this.creationDate,
  });

  TeacherMeeting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guideId = json['guideId'];
    teacherId = json['teacherId'];
    studentId = json['studentId'];
    classroomToSectionId = json['classroomToSectionId'];
    studentName = json['studentName'];
    parentPhone = json['parentPhone'];
    parentName = json['parentName'];
    teacherName = json['teacherName'];
    classroomToSectionName = json['classroomToSectionName'];
    meetingTime = json['meetingTime'];
    meetingTimeStr = json['meetingTimeStr'];
    status = json['status'];
    isAccepted = json['isAccepted'];
    isforStudent = json['isforStudent'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    creationDate = json['creationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['guideId'] = this.guideId;
    data['teacherId'] = this.teacherId;
    data['studentId'] = this.studentId;
    data['classroomToSectionId'] = this.classroomToSectionId;
    data['studentName'] = this.studentName;
    data['parentPhone'] = this.parentPhone;
    data['parentName'] = this.parentName;
    data['teacherName'] = this.teacherName;
    data['classroomToSectionName'] = this.classroomToSectionName;
    data['meetingTime'] = this.meetingTime;
    data['meetingTimeStr'] = this.meetingTimeStr;
    data['status'] = this.status;
    data['isAccepted'] = this.isAccepted;
    data['isforStudent'] = this.isforStudent;
    data['createdBy'] = this.createdBy;
    data['modifiedBy'] = this.modifiedBy;
    data['creationDate'] = this.creationDate;
    return data;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static TeacherMeeting fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return TeacherMeeting.fromJson(data);
  }
}
