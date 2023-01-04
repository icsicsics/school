import 'getImage.dart';

class Data {
  String? id;
  String? name;
  String? phoneNumber;
  String? email;
  GetImage? getImage;

  Data({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.getImage,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    getImage =
        json['getImage'] != null ? GetImage.fromJson(json['getImage']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    if (getImage != null) {
      map['getImage'] = getImage!.toJson();
    }
    return map;
  }
}
