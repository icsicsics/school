
class NotificationRequest {
  int? pageNo;
  int? pageSize;

  NotificationRequest({
    this.pageNo,
    this.pageSize,
  });

  NotificationRequest.fromJson(dynamic json) {
    pageNo = json['pageNo'];
    pageSize = json['pageSize'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNo'] = pageNo;
    map['pageSize'] = pageSize;
    return map;
  }
}

