import 'package:schools/data/source/remote/model/student_houses/search_item.dart';

class GetSearchValuesResponse {
  int? errorCode;
  String? errorMessage;
  List<SearchItem>? data;

  GetSearchValuesResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  GetSearchValuesResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = <SearchItem>[];
      json['data'].forEach((v) {
        data!.add(new SearchItem.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

