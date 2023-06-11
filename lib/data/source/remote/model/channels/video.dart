class Video {
  String? id;
  String? caption;
  String? mediaUrl;

  Video({
    this.id,
    this.caption,
    this.mediaUrl,
  });

  Video.fromJson(dynamic json) {
    id = json['id'];
    caption = json['caption'];
    mediaUrl = json['mediaUrl'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['caption'] = caption;
    map['mediaUrl'] = mediaUrl;
    return map;
  }
}
