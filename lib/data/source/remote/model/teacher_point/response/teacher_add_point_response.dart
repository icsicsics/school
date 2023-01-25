class TeacherAddPointResponse {
  int? errorCode;
  String? errorMessage;
  String? data;

  TeacherAddPointResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  TeacherAddPointResponse.fromJson(dynamic json) {
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
