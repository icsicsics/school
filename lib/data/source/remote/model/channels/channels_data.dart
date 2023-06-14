import 'video.dart';

class ChannelsData {
  String? id;
  String? title;
  String? description;
  int? status;
  Video? video;
  bool? isPlay;
  String? thumbnail;

  ChannelsData({
    this.id,
    this.title,
    this.description,
    this.status,
    this.video,
    this.isPlay = false,
    this.thumbnail = "",
  });

  ChannelsData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    video = json['getVideo'] != null ? Video.fromJson(json['getVideo']) : null;
    isPlay = false;
    thumbnail = "";
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['status'] = status;
    if (video != null) {
      map['getVideo'] = video!.toJson();
    }
    return map;
  }
}
