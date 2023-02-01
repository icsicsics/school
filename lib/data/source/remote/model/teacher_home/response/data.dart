import 'teacher_home_page.dart';
import 'get_logo.dart';

class Data {
  List<TeacherHomePage>? teacherHomePage;
  String? schoolName;
  GetLogo? getLogo;
  Data({
      this.teacherHomePage, 
      this.schoolName, 
      this.getLogo,});

  Data.fromJson(dynamic json) {
    if (json['teacherHomePage'] != null) {
      teacherHomePage = [];
      json['teacherHomePage'].forEach((v) {
        teacherHomePage!.add(TeacherHomePage.fromJson(v));
      });
    }
    schoolName = json['schoolName'];
    getLogo = json['getLogo'] != null ? GetLogo.fromJson(json['getLogo']) : null;
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
    return map;
  }

}