import 'dart:convert';

import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/indicator.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/teacher_meeting.dart';

import 'teacher_home_page.dart';
import 'get_logo.dart';

class TeacherHomeData {
  List<TeacherHomePage>? teacherHomePage;
  String? schoolName;
  GetLogo? getLogo;
  Indicator? indicator;
  List<TeacherMeeting>? meetings;
  List<ChannelsData>? videos;
  TeacherHomeData({
      this.teacherHomePage, 
      this.schoolName, 
      this.getLogo,
      this.indicator,
      this.meetings,
      this.videos,
  });

  TeacherHomeData.fromJson(dynamic json) {
    if (json['teacherHomePage'] != null) {
      teacherHomePage = [];
      json['teacherHomePage'].forEach((v) {
        teacherHomePage!.add(TeacherHomePage.fromJson(v));
      });
    }
    schoolName = json['schoolName'];
    getLogo = json['getLogo'] != null ? GetLogo.fromJson(json['getLogo']) : null;
    indicator = json['indecator'] != null ? Indicator.fromJson(json['indecator']) : null;
    if (json['mediaConfigurations'] != null) {
      videos = [];
      json['mediaConfigurations'].forEach((v) {
        videos!.add(ChannelsData.fromJson(v));
      });
    }
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
    if (videos != null) {
      map['mediaConfigurations'] = videos!.map((v) => v.toJson()).toList();
    }
    if (meetings != null) {
      map['teacherMeetings'] = meetings!.map((v) => v.toJson()).toList();
    }
    return map;
  }


  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static TeacherHomeData fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return TeacherHomeData.fromJson(data);
  }
}
