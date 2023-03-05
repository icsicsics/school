class UpdateDeviceResponse {
  int? errorCode;
  String? errorMessage;
  Data? data;

  UpdateDeviceResponse({this.errorCode, this.errorMessage, this.data});

  UpdateDeviceResponse.fromJson(Map<String, dynamic> json) {
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
  bool? succeeded;
  List<String>? errors;

  Data({this.succeeded, this.errors});

  Data.fromJson(Map<String, dynamic> json) {
    succeeded = json['succeeded'];
    errors = json['errors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['succeeded'] = this.succeeded;
    data['errors'] = this.errors;
    return data;
  }
}
