class CreateNoteRequest {
  List<String>? guideList;
  String? studentId;
  String? teacherId;
  String? noteDetails;
  bool? noteStatus;

  CreateNoteRequest({
    this.guideList,
    this.studentId,
    this.teacherId,
    this.noteDetails,
    this.noteStatus,
  });

  CreateNoteRequest.fromJson(dynamic json) {
    guideList = json['guideList'];
    studentId = json['studentId'];
    teacherId = json['teacherId'];
    noteDetails = json['noteDetails'];
    noteStatus = json['noteStatus'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guideList'] = guideList;
    map['studentId'] = studentId;
    map['teacherId'] = teacherId;
    map['noteDetails'] = noteDetails;
    map['noteStatus'] = noteStatus;
    return map;
  }
}
