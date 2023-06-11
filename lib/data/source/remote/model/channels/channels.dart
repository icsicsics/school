import 'package:schools/data/source/remote/model/channels/channels_data.dart';

class Channels {
  int? errorCode;
  String? errorMessage;
  List<ChannelsData>? channelsData;

  Channels({
    this.errorCode,
    this.errorMessage,
    this.channelsData,
  });

  Channels.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      channelsData = [];
      json['data'].forEach((v) {
        channelsData!.add(ChannelsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorCode'] = errorCode;
    map['errorMessage'] = errorMessage;
    map['data'] = channelsData;
    if (channelsData != null) {
      map['data'] = channelsData!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
