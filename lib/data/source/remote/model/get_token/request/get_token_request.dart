class GetTokenRequest {
  String? email;
  String? password;

  GetTokenRequest({
    this.email,
    this.password,
  });

  GetTokenRequest.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
