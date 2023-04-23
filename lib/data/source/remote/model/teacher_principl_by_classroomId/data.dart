class Data {
  String? id;
  String? principleId;
  String? name;

  Data({
    this.id,
    this.name,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    principleId = json['principleId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['principleId'] = principleId;
    map['name'] = name;
    return map;
  }
}
