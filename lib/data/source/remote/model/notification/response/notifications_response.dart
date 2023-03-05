class NotificationsResponse {
  int? errorCode;
  String? errorMessage;
  List<NotificationItem>? notificationItem;

  NotificationsResponse({
    this.errorCode,
    this.errorMessage,
    this.notificationItem,
  });

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      notificationItem = <NotificationItem>[];
      json['data'].forEach((v) {
        notificationItem!.add(new NotificationItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMessage'] = this.errorMessage;
    if (this.notificationItem != null) {
      data['data'] = this.notificationItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationItem {
  String? emails;
  String? title;
  String? body;
  int? sendToType;
  int? status;
  String? createdBy;
  Null? modifiedBy;
  String? creationDate;
  Null? modificationDate;
  String? id;

  NotificationItem(
      {this.emails,
      this.title,
      this.body,
      this.sendToType,
      this.status,
      this.createdBy,
      this.modifiedBy,
      this.creationDate,
      this.modificationDate,
      this.id});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    emails = json['emails'];
    title = json['title'];
    body = json['body'];
    sendToType = json['sendToType'];
    status = json['status'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    creationDate = json['creationDate'];
    modificationDate = json['modificationDate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emails'] = this.emails;
    data['title'] = this.title;
    data['body'] = this.body;
    data['sendToType'] = this.sendToType;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['modifiedBy'] = this.modifiedBy;
    data['creationDate'] = this.creationDate;
    data['modificationDate'] = this.modificationDate;
    data['id'] = this.id;
    return data;
  }
}
