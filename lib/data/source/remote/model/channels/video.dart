class Video {
  String? id;
  String? caption;
  String? mediaUrl;
  String? thumbnail;

  Video({
    this.id,
    this.caption,
    this.mediaUrl,
    this.thumbnail ,
  });

  Video.fromJson(dynamic json) {
    id = json['id'];
    caption = json['caption'];
    mediaUrl = json['mediaUrl'];
    thumbnail = "assets/images/ic_video_placeholder.png";
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['caption'] = caption;
    map['mediaUrl'] = mediaUrl;
    return map;
  }
}
