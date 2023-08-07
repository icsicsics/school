
import 'dart:convert';

import 'package:schools/data/source/remote/model/advisors/response/guide.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/children.dart';
import 'package:schools/data/source/remote/model/class_houses/class_houses_data.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_data.dart';
import 'package:schools/data/source/remote/model/notification/response/notifications_response.dart';
import 'package:schools/data/source/remote/model/student_houses/search_item.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/teacher_home_data.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_data.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/teacher_principle_data.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/student_profile_in_school_house.dart';

class ParentOfflineData {
  List<Children>? children;
  FatherInfoData? fatherInfoData;
  List<NotificationItem>? notifications;
  List<NotificationItem>? inboxNotifications;
  List<ClassHousesData>? classHouses;
  List<StudentProfileInSchoolHouseData>? teacherStudentsSection;
  List<ClassHousesData>? schoolHouses;
  List<TeacherPrincipleData>? principlesByClassroomId;
  List<SearchItem>? searchByDateEnum;

  ParentOfflineData(
      {this.children,
        this.fatherInfoData,
        this.notifications,
        this.inboxNotifications,
        this.classHouses,
        this.teacherStudentsSection,
        this.schoolHouses,
        this.principlesByClassroomId,
        this.searchByDateEnum});

  ParentOfflineData.fromJson(Map<String, dynamic> json) {
    if (json['ChildrensByParent'] != null) {
      children = [];
      json['ChildrensByParent'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    fatherInfoData = json['ParentInfo'] != null
        ? new FatherInfoData.fromJson(json['ParentInfo'])
        : null;
    if (json['Notifications'] != null) {
      notifications = <NotificationItem>[];
      json['Notifications'].forEach((v) {
        notifications!.add(new NotificationItem.fromJson(v));
      });
    }
    if (json['InboxNotifications'] != null) {
      inboxNotifications = <NotificationItem>[];
      json['InboxNotifications'].forEach((v) {
        inboxNotifications!.add(new NotificationItem.fromJson(v));
      });
    }
    if (json['ClassHouses'] != null) {
      classHouses = <ClassHousesData>[];
      json['ClassHouses'].forEach((v) {
        classHouses!.add(new ClassHousesData.fromJson(v));
      });
    }
    if (json['TeacherStudentsSection'] != null) {
      teacherStudentsSection = <StudentProfileInSchoolHouseData>[];
      json['TeacherStudentsSection'].forEach((v) {
        teacherStudentsSection!.add(new StudentProfileInSchoolHouseData.fromJson(v));
      });
    }
    if (json['SchoolHouses'] != null) {
      schoolHouses = <ClassHousesData>[];
      json['SchoolHouses'].forEach((v) {
        schoolHouses!.add(new ClassHousesData.fromJson(v));
      });
    }
    if (json['PrinciplesByClassroomId'] != null) {
      principlesByClassroomId = <TeacherPrincipleData>[];
      json['PrinciplesByClassroomId'].forEach((v) {
        principlesByClassroomId!.add(new TeacherPrincipleData.fromJson(v));
      });
    }
    if (json['SearchByDateEnum'] != null) {
      searchByDateEnum = <SearchItem>[];
      json['SearchByDateEnum'].forEach((v) {
        searchByDateEnum!.add(new SearchItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.children != null) {
      data['ChildrensByParent'] =
          this.children!.map((v) => v.toJson()).toList();
    }
    if (this.fatherInfoData != null) {
      data['ParentInfo'] = this.fatherInfoData!.toJson();
    }
    if (this.notifications != null) {
      data['Notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    if (this.inboxNotifications != null) {
      data['InboxNotifications'] =
          this.inboxNotifications!.map((v) => v.toJson()).toList();
    }
    if (this.classHouses != null) {
      data['ClassHouses'] = this.classHouses!.map((v) => v.toJson()).toList();
    }
    if (this.teacherStudentsSection != null) {
      data['TeacherStudentsSection'] =
          this.teacherStudentsSection!.map((v) => v.toJson()).toList();
    }
    if (this.schoolHouses != null) {
      data['SchoolHouses'] = this.schoolHouses!.map((v) => v.toJson()).toList();
    }
    if (this.principlesByClassroomId != null) {
      data['PrinciplesByClassroomId'] =
          this.principlesByClassroomId!.map((v) => v.toJson()).toList();
    }
    if (this.searchByDateEnum != null) {
      data['SearchByDateEnum'] =
          this.searchByDateEnum!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static ParentOfflineData fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return ParentOfflineData.fromJson(data);
  }
}
