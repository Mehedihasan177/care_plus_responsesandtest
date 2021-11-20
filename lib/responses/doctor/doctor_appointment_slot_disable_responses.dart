// To parse this JSON data, do
//
//     final doctorAppointmentSlotDisableResponse = doctorAppointmentSlotDisableResponseFromJson(jsonString);

import 'dart:convert';

DoctorAppointmentSlotDisableResponse doctorAppointmentSlotDisableResponseFromJson(String str) => DoctorAppointmentSlotDisableResponse.fromJson(json.decode(str));

String doctorAppointmentSlotDisableResponseToJson(DoctorAppointmentSlotDisableResponse data) => json.encode(data.toJson());

class DoctorAppointmentSlotDisableResponse {
  DoctorAppointmentSlotDisableResponse({
    required this.message,
    required this.doctorAppointmentSlotDisableResponses,
  });

  String message;
  DoctorAppointmentSlotDisableResponses doctorAppointmentSlotDisableResponses;

  factory DoctorAppointmentSlotDisableResponse.fromJson(Map<String, dynamic> json) => DoctorAppointmentSlotDisableResponse(
    message: json["message"],
    doctorAppointmentSlotDisableResponses: DoctorAppointmentSlotDisableResponses.fromJson(json["DoctorAppointmentSlotDisableResponses"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DoctorAppointmentSlotDisableResponses": doctorAppointmentSlotDisableResponses.toJson(),
  };
}

class DoctorAppointmentSlotDisableResponses {
  DoctorAppointmentSlotDisableResponses({
    required this.id,
    required this.doctorId,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  int doctorId;
  String startTime;
  String endTime;
  String day;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory DoctorAppointmentSlotDisableResponses.fromJson(Map<String, dynamic> json) => DoctorAppointmentSlotDisableResponses(
    id: json["id"],
    doctorId: json["doctor_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    day: json["day"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "start_time": startTime,
    "end_time": endTime,
    "day": day,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
