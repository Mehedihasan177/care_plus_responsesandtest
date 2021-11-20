// To parse this JSON data, do
//
//     final notificationDeleteResponse = notificationDeleteResponseFromJson(jsonString);

import 'dart:convert';

NotificationDeleteResponse notificationDeleteResponseFromJson(String str) => NotificationDeleteResponse.fromJson(json.decode(str));

String notificationDeleteResponseToJson(NotificationDeleteResponse data) => json.encode(data.toJson());

class NotificationDeleteResponse {
  NotificationDeleteResponse({
    required this.data,
  });

  String data;

  factory NotificationDeleteResponse.fromJson(Map<String, dynamic> json) => NotificationDeleteResponse(
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
  };
}
