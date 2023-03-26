class LoginResponse {
  int? errorCode;
  String? errorMessage;
  Data? data;

  LoginResponse({this.errorCode, this.errorMessage, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? roles;
  String? verifyCode;

  Data({this.roles});

  Data.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>();
    verifyCode = json['verifyCode'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roles'] = this.roles;
    data['verifyCode'] = this.verifyCode;
    return data;
  }
}

class LoginErrorResponse {
  String? data;

  LoginErrorResponse({this.data});

  LoginErrorResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
}