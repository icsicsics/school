import 'getImage.dart';

class Data {
  String? studentName;
  String? studentId;
  GetImage? getImage;
  String? branchId;

  Data({
    this.studentName,
    this.studentId,
    this.getImage,
    this.branchId,
  });

  Data.fromJson(dynamic json) {
    studentName = json['studentName'];
    studentId = json['studentId'];
    branchId = json['branchId'];
    getImage =
        json['getImage'] != null ? GetImage.fromJson(json['getImage']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['studentName'] = studentName;
    map['studentId'] = studentId;
    map['branchId'] = branchId;
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    return map;
  }
}
