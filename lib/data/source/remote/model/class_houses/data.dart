class Data {
  String? houseName;
  int? numberStudentsHouse;
  int? numberTeachersHouse;
  int? totalPointsHouse;
  String? houseId;
  String? classroomToSectionId;

  Data({
    this.houseName,
    this.numberStudentsHouse,
    this.numberTeachersHouse,
    this.totalPointsHouse,
    this.houseId,
    this.classroomToSectionId,
  });

  Data.fromJson(dynamic json) {
    houseName = json['houseName'];
    numberStudentsHouse = json['numberStudentsHouse'];
    numberTeachersHouse = json['numberTeachersHouse'];
    totalPointsHouse = json['totalPointsHouse'];
    houseId = json['houseId'];
    classroomToSectionId = json['classroomToSectionId'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['houseName'] = houseName;
    map['numberStudentsHouse'] = numberStudentsHouse;
    map['numberTeachersHouse'] = numberTeachersHouse;
    map['totalPointsHouse'] = totalPointsHouse;
    map['houseId'] = houseId;
    map['classroomToSectionId'] = classroomToSectionId;
    return map;
  }
}
