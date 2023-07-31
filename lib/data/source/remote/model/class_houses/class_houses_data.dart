import 'dart:convert';

class ClassHousesData {
  String? houseName;
  String? houseIcon;
  int? numberStudentsHouse;
  int? numberTeachersHouse;
  int? totalPointsHouse;
  String? houseId;
  String? classroomToSectionId;

  ClassHousesData({
    this.houseName,
    this.houseIcon,
    this.numberStudentsHouse,
    this.numberTeachersHouse,
    this.totalPointsHouse,
    this.houseId,
    this.classroomToSectionId,
  });

  ClassHousesData.fromJson(dynamic json) {
    houseName = json['houseName'];
    houseIcon = json['houseIcon'];
    numberStudentsHouse = json['numberStudentsHouse'];
    numberTeachersHouse = json['numberTeachersHouse'];
    totalPointsHouse = json['totalPointsHouse'];
    houseId = json['houseId'];
    classroomToSectionId = json['classroomToSectionId'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['houseName'] = houseName;
    map['houseIcon'] = houseIcon;
    map['numberStudentsHouse'] = numberStudentsHouse;
    map['numberTeachersHouse'] = numberTeachersHouse;
    map['totalPointsHouse'] = totalPointsHouse;
    map['houseId'] = houseId;
    map['classroomToSectionId'] = classroomToSectionId;
    return map;
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static ClassHousesData fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return ClassHousesData.fromJson(data);
  }
}
