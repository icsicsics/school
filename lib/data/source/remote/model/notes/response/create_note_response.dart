class CreateNoteResponse {
  int? errorCode;
  String? errorMessage;
  String? data;

  CreateNoteResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  CreateNoteResponse.fromJson(dynamic json) {
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
