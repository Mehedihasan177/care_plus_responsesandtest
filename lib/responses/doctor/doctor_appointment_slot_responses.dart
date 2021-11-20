// To parse this JSON data, do
//
//     final doctorAppointmentSlotResponse = doctorAppointmentSlotResponseFromJson(jsonString);

import 'dart:convert';

DoctorAppointmentSlotResponse doctorAppointmentSlotResponseFromJson(String str) => DoctorAppointmentSlotResponse.fromJson(json.decode(str));

String doctorAppointmentSlotResponseToJson(DoctorAppointmentSlotResponse data) => json.encode(data.toJson());

class DoctorAppointmentSlotResponse {
  DoctorAppointmentSlotResponse({
    required this.message,
    required this.doctorAppointmentSlotResponses,
  });

  String message;
  DoctorAppointmentSlotResponses doctorAppointmentSlotResponses;

  factory DoctorAppointmentSlotResponse.fromJson(Map<String, dynamic> json) => DoctorAppointmentSlotResponse(
    message: json["message"],
    doctorAppointmentSlotResponses: DoctorAppointmentSlotResponses.fromJson(json["DoctorAppointmentSlotResponses"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DoctorAppointmentSlotResponses": doctorAppointmentSlotResponses.toJson(),
  };
}

class DoctorAppointmentSlotResponses {
  DoctorAppointmentSlotResponses({
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

  factory DoctorAppointmentSlotResponses.fromJson(Map<String, dynamic> json) => DoctorAppointmentSlotResponses(
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
