// To parse this JSON data, do
//
//     final doctorAppointmentOnGoingResponse = doctorAppointmentOnGoingResponseFromJson(jsonString);

import 'dart:convert';

DoctorAppointmentOnGoingResponse doctorAppointmentOnGoingResponseFromJson(String str) => DoctorAppointmentOnGoingResponse.fromJson(json.decode(str));

String doctorAppointmentOnGoingResponseToJson(DoctorAppointmentOnGoingResponse data) => json.encode(data.toJson());

class DoctorAppointmentOnGoingResponse {
  DoctorAppointmentOnGoingResponse({
    required this.message,
    required this.data,
  });

  String message;
  String data;

  factory DoctorAppointmentOnGoingResponse.fromJson(Map<String, dynamic> json) => DoctorAppointmentOnGoingResponse(
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
  };
}
