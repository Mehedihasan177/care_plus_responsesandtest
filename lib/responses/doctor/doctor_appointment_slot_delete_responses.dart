// To parse this JSON data, do
//
//     final doctorAppointmentSlotDeleteeResponse = doctorAppointmentSlotDeleteeResponseFromJson(jsonString);

import 'dart:convert';

DoctorAppointmentSlotDeleteeResponse doctorAppointmentSlotDeleteeResponseFromJson(String str) => DoctorAppointmentSlotDeleteeResponse.fromJson(json.decode(str));

String doctorAppointmentSlotDeleteeResponseToJson(DoctorAppointmentSlotDeleteeResponse data) => json.encode(data.toJson());

class DoctorAppointmentSlotDeleteeResponse {
  DoctorAppointmentSlotDeleteeResponse({
    required this.message,
    required this.data,
  });

  String message;
  String data;

  factory DoctorAppointmentSlotDeleteeResponse.fromJson(Map<String, dynamic> json) => DoctorAppointmentSlotDeleteeResponse(
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
  };
}
