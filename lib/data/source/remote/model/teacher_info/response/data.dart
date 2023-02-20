import 'get_image.dart';
import 'classrooms_teacher.dart';

class Data {
  String? id;
  String? branchId;
  String? name;
  String? phoneNumber;
  String? email;
  String? houseName;
  GetImage? getImage;
  List<ClassroomsTeacher>? classroomsTeacher;

  Data({
    this.id,
    this.branchId,
    this.name,
    this.phoneNumber,
    this.email,
    this.houseName,
    this.getImage,
    this.classroomsTeacher,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    branchId = json['branchId'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    houseName = json['houseName'];
    getImage =
        json['getImage'] != null ? GetImage.fromJson(json['getImage']) : null;
    if (json['classroomsTeacher'] != null) {
      classroomsTeacher = [];
      json['classroomsTeacher'].forEach((v) {
        classroomsTeacher!.add(ClassroomsTeacher.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['branchId'] = branchId;
    map['name'] = name;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['houseName'] = houseName;
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    if (classroomsTeacher != null) {
      map['classroomsTeacher'] =
          classroomsTeacher!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
