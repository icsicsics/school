class UpdateNotificationResponse {
  int? errorCode;
  String? errorMessage;
  String? data;

  UpdateNotificationResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  UpdateNotificationResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    errorMessage = json['data'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMessage'] = this.errorMessage;
    data['data'] = this.data;
    return data;
  }
}
