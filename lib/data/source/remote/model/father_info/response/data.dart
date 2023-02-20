import 'childrens.dart';

class Data {
  String? phoneNumber;
  String? parentName;
  List<Childrens>? childrens;

  Data({
    this.phoneNumber,
    this.parentName,
    this.childrens,
  });

  Data.fromJson(dynamic json) {
    phoneNumber = json['phoneNumber'];
    parentName = json['parentName'];
    if (json['childrens'] != null) {
      childrens = [];
      json['childrens'].forEach((v) {
        childrens!.add(Childrens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = phoneNumber;
    map['parentName'] = parentName;
    if (childrens != null) {
      map['childrens'] = childrens!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
