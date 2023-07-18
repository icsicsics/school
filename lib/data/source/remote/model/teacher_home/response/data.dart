import 'package:schools/data/source/remote/model/teacher_home/response/indicator.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/teacher_meeting.dart';

import 'teacher_home_page.dart';
import 'get_logo.dart';

class Data {
  List<TeacherHomePage>? teacherHomePage;
  String? schoolName;
  GetLogo? getLogo;
  Indicator? indicator;
  List<TeacherMeeting>? meetings;
  Data({
      this.teacherHomePage, 
      this.schoolName, 
      this.getLogo,
      this.indicator,
      this.meetings,
  });

  Data.fromJson(dynamic json) {
    if (json['teacherHomePage'] != null) {
      teacherHomePage = [];
      json['teacherHomePage'].forEach((v) {
        teacherHomePage!.add(TeacherHomePage.fromJson(v));
      });
    }
    schoolName = json['schoolName'];
    getLogo = json['getLogo'] != null ? GetLogo.fromJson(json['getLogo']) : null;
    indicator = json['indecator'] != null ? Indicator.fromJson(json['indecator']) : null;
    if (json['teacherMeetings'] != null) {
      meetings = [];
      json['teacherMeetings'].forEach((v) {
        meetings!.add(TeacherMeeting.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (teacherHomePage != null) {
      map['teacherHomePage'] = teacherHomePage!.map((v) => v.toJson()).toList();
    }
    map['schoolName'] = schoolName;
    if (getLogo != null) {
      map['getLogo'] = getLogo!.toJson();
    }
    if (indicator != null) {
      map['indecator'] = indicator!.toJson();
    }
    if (meetings != null) {
      map['teacherMeetings'] = meetings!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
