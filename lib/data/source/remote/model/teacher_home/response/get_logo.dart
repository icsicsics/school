class GetLogo{
String? id;
String? caption;
String? mediaUrl;

  GetLogo({
      this.id, 
      this.caption, 
      this.mediaUrl,});

  GetLogo.fromJson(dynamic json) {
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