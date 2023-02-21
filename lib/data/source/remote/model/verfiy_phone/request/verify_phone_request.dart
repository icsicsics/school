class VerifyPhoneRequest {
  String? phoneNumber;

  VerifyPhoneRequest({
    this.phoneNumber,
  });

  VerifyPhoneRequest.fromJson(dynamic json) {
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = phoneNumber;
    return map;
  }
}
