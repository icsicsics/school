class CreateMeetingRequest {
  String? guideId;
  String? teacherId;
  String? studentId;
  String? classroomToSectionId;
  String? meetingTime;

  CreateMeetingRequest({
    this.guideId,
    this.teacherId,
    this.studentId,
    this.classroomToSectionId,
    this.meetingTime,
  });

  CreateMeetingRequest.fromJson(dynamic json) {
    guideId = json['guideId'];
    teacherId = json['teacherId'];
    studentId = json['studentId'];
    classroomToSectionId = json['classroomToSectionId'];
    meetingTime = json['meetingTime'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guideId'] = guideId;
    map['teacherId'] = teacherId;
    map['studentId'] = studentId;
    map['classroomToSectionId'] = classroomToSectionId;
    map['meetingTime'] = meetingTime;
    return map;
  }
}
