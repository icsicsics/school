import 'package:schools/data/source/remote/model/get_token/response/token.dart';

class Data {
  Token? token;
  String? userId;
  String? username;
  String? name;

  Data({this.token, this.username, this.name,});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    userId = json['userId'];
    username = json['username'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['name'] = this.name;
    return data;
  }
}