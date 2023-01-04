class Data {
  String? token;
  String? username;
  String? name;
  List<String>? roles;

  Data({
    this.token,
    this.username,
    this.name,
    this.roles,
  });

  Data.fromJson(dynamic json) {
    token = json['token'];
    username = json['username'];
    name = json['name'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['username'] = username;
    map['name'] = name;
    map['roles'] = roles;
    return map;
  }
}
