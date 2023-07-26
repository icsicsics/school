import 'get_image.dart';
import 'classrooms_teacher.dart';

class Data {
  String? id;
  String? branchId;
  String? name;
  String? houseIcon;
  String? phoneNumber;
  String? email;
  String? houseName;
  String? facebookURL;
  String? instagramURL;
  String? tweeterURL;
  String? snapchatURL;
  String? websiteURL;
  GetImage? getImage;
  List<ClassroomsTeacher>? classroomsTeacher;

  Data({
    this.id,
    this.branchId,
    this.name,
    this.phoneNumber,
    this.houseIcon,
    this.email,
    this.houseName,
    this.facebookURL,
    this.instagramURL,
    this.tweeterURL,
    this.snapchatURL,
    this.websiteURL,
    this.getImage,
    this.classroomsTeacher,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    houseIcon = json['houseIcon'];
    branchId = json['branchId'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    houseName = json['houseName'];
    facebookURL = json['facebookURL'];
    instagramURL = json['instagramURL'];
    tweeterURL = json['tweeterURL'];
    snapchatURL = json['snapchatURL'];
    websiteURL = json['websiteURL'];
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
    map['houseIcon'] = houseIcon;
    map['email'] = email;
    map['houseName'] = houseName;
    map['facebookURL'] = facebookURL;
    map['instagramURL'] = instagramURL;
    map['tweeterURL'] = tweeterURL;
    map['snapchatURL'] = snapchatURL;
    map['websiteURL'] = websiteURL;
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
