import 'data.dart';

class GetChildrenByParentResponse {
  int? errorCode;
  String? errorMessage;
  List<Data>? data;
  GetChildrenByParentResponse({
      this.errorCode, 
      this.errorMessage, 
      this.data,});

  GetChildrenByParentResponse.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorCode'] = errorCode;
    map['errorMessage'] = errorMessage;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}