// To parse this JSON data, do
//
//     final allDoctorSlotResponse = allDoctorSlotResponseFromJson(jsonString);

import 'dart:convert';

Map<String, List<DoctorWithTimeSlotResponse>> allDoctorSlotResponseFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<DoctorWithTimeSlotResponse>>(k, List<DoctorWithTimeSlotResponse>.from(v.map((x) => DoctorWithTimeSlotResponse.fromJson(x)))));

String allDoctorSlotResponseToJson(Map<String, List<DoctorWithTimeSlotResponse>> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))));

class DoctorWithTimeSlotResponse {
  DoctorWithTimeSlotResponse({
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

  factory DoctorWithTimeSlotResponse.fromJson(Map<String, dynamic> json) => DoctorWithTimeSlotResponse(
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
