import 'package:schools/data/source/remote/model/get_token/response/token.dart';

class Data {
  Token? token;
  String? username;
  String? name;
  List<int>? roles;

  Data({this.token, this.username, this.name, this.roles});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    username = json['username'];
    name = json['name'];
    roles = json['roles'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['username'] = this.username;
    data['name'] = this.name;
    data['roles'] = this.roles;
    return data;
  }
}