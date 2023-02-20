import 'getImage.dart';

class Data {
  String? studentName;
  String? studentId;
  GetImage? getImage;

  Data({
    this.studentName,
    this.studentId,
    this.getImage,
  });

  Data.fromJson(dynamic json) {
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
