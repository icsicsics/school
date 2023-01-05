import 'getImage.dart';

class Childrens {
  String? studentName;
  String? studentId;
  GetImage? getImage;

  Childrens({
    this.studentName,
    this.studentId,
    this.getImage,
  });

  Childrens.fromJson(dynamic json) {
    studentName = json['studentName'];
    studentId = json['studentId'];
    getImage =
        json['getImage'] != null ? GetImage.fromJson(json['getImage']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['studentName'] = studentName;
    map['studentId'] = studentId;
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    return map;
  }
}
