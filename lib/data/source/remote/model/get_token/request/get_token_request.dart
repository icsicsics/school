class GetTokenRequest {
  String? phoneNumber;
  String? verifyCode;

  GetTokenRequest({
    this.phoneNumber,
    this.verifyCode,
  });

  GetTokenRequest.fromJson(dynamic json) {
    phoneNumber = json['phoneNumber'];
    verifyCode = json['verifyCode'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = phoneNumber;
    map['verifyCode'] = verifyCode;
    return map;
  }
}
