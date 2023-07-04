import 'dart:ui';

import 'package:schools/data/source/remote/model/children_by_parent/response/getImage.dart';

import 'video.dart';

class ChannelsData {
  String? id;
  String? title;
  String? description;
  int? status;
  Video? video;
  bool? isPlay;
  GetImage? image;

  ChannelsData({
    this.id,
    this.title,
    this.description,
    this.status,
    this.video,
    this.isPlay = false,
    this.image,
  });

  ChannelsData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    video = json['getVideo'] != null ? Video.fromJson(json['getVideo']) : null;
    isPlay = false;
    image = json['getImage'] != null ? GetImage.fromJson(json['getVideo']) : null;
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
    if (image != null) {
      map['getImage'] = image!.toJson();
    }
    return map;
  }
}
