// To parse this JSON data, do
//
//     final doctorEPrescriptionShowResponse = doctorEPrescriptionShowResponseFromJson(jsonString);

import 'dart:convert';

DoctorEPrescriptionShowResponse doctorEPrescriptionShowResponseFromJson(String str) => DoctorEPrescriptionShowResponse.fromJson(json.decode(str));

String doctorEPrescriptionShowResponseToJson(DoctorEPrescriptionShowResponse data) => json.encode(data.toJson());

class DoctorEPrescriptionShowResponse {
  DoctorEPrescriptionShowResponse({
    required this.message,
    required this.doctorEPrescriptionShow,
  });

  String message;
  DoctorEPrescriptionShow doctorEPrescriptionShow;

  factory DoctorEPrescriptionShowResponse.fromJson(Map<String, dynamic> json) => DoctorEPrescriptionShowResponse(
    message: json["message"],
    doctorEPrescriptionShow: DoctorEPrescriptionShow.fromJson(json["DoctorEPrescriptionShow"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DoctorEPrescriptionShow": doctorEPrescriptionShow.toJson(),
  };
}

class DoctorEPrescriptionShow {
  DoctorEPrescriptionShow({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentScheduleId,
    required this.cc,
    this.oe,
    required this.advice,
    this.rx,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  int userId;
  int doctorId;
  int appointmentScheduleId;
  String cc;
  dynamic oe;
  String advice;
  dynamic rx;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory DoctorEPrescriptionShow.fromJson(Map<String, dynamic> json) => DoctorEPrescriptionShow(
    id: json["id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    appointmentScheduleId: json["appointment_schedule_id"],
    cc: json["cc"],
    oe: json["oe"],
    advice: json["advice"],
    rx: json["rx"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "appointment_schedule_id": appointmentScheduleId,
    "cc": cc,
    "oe": oe,
    "advice": advice,
    "rx": rx,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
