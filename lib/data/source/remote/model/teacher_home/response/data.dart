import 'get_logo.dart';

class Data {
  String ?id;
  String ?classroomToSectionId;
  String ?classroomName;
  String ?sectionName;
  String ?schoolName;
  GetLogo? getLogo;
  Data({
      this.id, 
      this.classroomToSectionId, 
      this.classroomName, 
      this.sectionName, 
      this.schoolName, 
      this.getLogo,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    classroomToSectionId = json['classroomToSectionId'];
    classroomName = json['classroomName'];
    sectionName = json['sectionName'];
    schoolName = json['schoolName'];
    getLogo = json['getLogo'] != null ? GetLogo.fromJson(json['getLogo']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['classroomToSectionId'] = classroomToSectionId;
    map['classroomName'] = classroomName;
    map['sectionName'] = sectionName;
    map['schoolName'] = schoolName;
    if (getLogo != null) {
      map['getLogo'] = getLogo!.toJson();
    }
    return map;
  }

}