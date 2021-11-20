// To parse this JSON data, do
//
//     final userByAppointmentSlotResponse = userByAppointmentSlotResponseFromJson(jsonString);

import 'dart:convert';

UserByAppointmentSlotResponse userByAppointmentSlotResponseFromJson(String str) => UserByAppointmentSlotResponse.fromJson(json.decode(str));

String userByAppointmentSlotResponseToJson(UserByAppointmentSlotResponse data) => json.encode(data.toJson());

class UserByAppointmentSlotResponse {
  UserByAppointmentSlotResponse({
    required this.message,
    required this.data,
  });

  String message;
  List<dynamic> data;

  factory UserByAppointmentSlotResponse.fromJson(Map<String, dynamic> json) => UserByAppointmentSlotResponse(
    message: json["message"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
