import 'package:schools/data/source/remote/model/advisors/response/guide.dart';

class GuideModel {
  int? errorCode;
  String? errorMessage;
  List<Guide>? guides;

  GuideModel({
    this.errorCode,
    this.errorMessage,
    this.guides,
  });

  GuideModel.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      guides = [];
      json['data'].forEach((v) {
        guides!.add(Guide.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMessage'] = this.errorMessage;
    if (this.guides != null) {
      data['data'] = this.guides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
