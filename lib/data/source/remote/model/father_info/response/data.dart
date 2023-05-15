import 'package:schools/data/source/remote/model/children_by_parent/response/getImage.dart';

import 'childrens.dart';

class Data {
  String? phoneNumber;
  String? parentName;
  List<Childrens>? childrens;
  GetImage? getImage;

  Data({
    this.phoneNumber,
    this.parentName,
    this.childrens,
    this.getImage,
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
    ;
    getImage =
        json['getImage'] != null ? GetImage.fromJson(json['getImage']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = phoneNumber;
    map['parentName'] = parentName;
    if (childrens != null) {
      map['childrens'] = childrens!.map((v) => v.toJson()).toList();
    }
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    return map;
  }
}
