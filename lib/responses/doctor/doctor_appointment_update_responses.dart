// To parse this JSON data, do
//
//     final doctorAppointmentUpdateResponse = doctorAppointmentUpdateResponseFromJson(jsonString);

import 'dart:convert';

DoctorAppointmentUpdateResponse doctorAppointmentUpdateResponseFromJson(String str) => DoctorAppointmentUpdateResponse.fromJson(json.decode(str));

String doctorAppointmentUpdateResponseToJson(DoctorAppointmentUpdateResponse data) => json.encode(data.toJson());

class DoctorAppointmentUpdateResponse {
  DoctorAppointmentUpdateResponse({
    required this.message,
    required this.doctorAppointmentUpdateResponses,
  });

  String message;
  DoctorAppointmentUpdateResponses doctorAppointmentUpdateResponses;

  factory DoctorAppointmentUpdateResponse.fromJson(Map<String, dynamic> json) => DoctorAppointmentUpdateResponse(
    message: json["message"],
    doctorAppointmentUpdateResponses: DoctorAppointmentUpdateResponses.fromJson(json["DoctorAppointmentUpdateResponses"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DoctorAppointmentUpdateResponses": doctorAppointmentUpdateResponses.toJson(),
  };
}

class DoctorAppointmentUpdateResponses {
  DoctorAppointmentUpdateResponses({
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
  List<String> day;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory DoctorAppointmentUpdateResponses.fromJson(Map<String, dynamic> json) => DoctorAppointmentUpdateResponses(
    id: json["id"],
    doctorId: json["doctor_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    day: List<String>.from(json["day"].map((x) => x)),
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
    "day": List<dynamic>.from(day.map((x) => x)),
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
