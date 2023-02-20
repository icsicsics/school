class FatherAddPointResponse {
  int? errorCode;
  String? errorMessage;
  String? data;

  FatherAddPointResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  FatherAddPointResponse.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorCode'] = errorCode;
    map['errorMessage'] = errorMessage;
    map['data'] = data;
    return map;
  }
}
