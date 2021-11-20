// To parse this JSON data, do
//
//     final doctorNotificationDeleteResponse = doctorNotificationDeleteResponseFromJson(jsonString);

import 'dart:convert';

DoctorNotificationDeleteResponse doctorNotificationDeleteResponseFromJson(String str) => DoctorNotificationDeleteResponse.fromJson(json.decode(str));

String doctorNotificationDeleteResponseToJson(DoctorNotificationDeleteResponse data) => json.encode(data.toJson());

class DoctorNotificationDeleteResponse {
  DoctorNotificationDeleteResponse({
    required this.data,
  });

  String data;

  factory DoctorNotificationDeleteResponse.fromJson(Map<String, dynamic> json) => DoctorNotificationDeleteResponse(
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
  };
}
