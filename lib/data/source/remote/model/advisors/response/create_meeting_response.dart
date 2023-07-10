class CreateMeetingResponse {
  String? errorCode;
  String? errorMessage;
  String? data;

  CreateMeetingResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  CreateMeetingResponse.fromJson(dynamic json) {
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
