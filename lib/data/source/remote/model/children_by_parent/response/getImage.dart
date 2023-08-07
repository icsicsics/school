import 'dart:convert';

class GetImage {
  String? id;
  String? caption;
  String? mediaUrl;
  GetImage({
      this.id, 
      this.caption, 
      this.mediaUrl,});

  GetImage.fromJson(dynamic json) {
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


  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static GetImage fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return GetImage.fromJson(data);
  }

}