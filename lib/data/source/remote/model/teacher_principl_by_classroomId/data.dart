class Data {
  String? id;
  String? principleId;
  String? name;
  String? icon;

  Data({
    this.id,
    this.principleId,
    this.name,
    this.icon,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    principleId = json['principleId'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['principleId'] = principleId;
    map['name'] = name;
    map['icon'] = icon;
    return map;
  }
}
