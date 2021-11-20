// To parse this JSON data, do
//
//     final updateEPrescriptionResponse = updateEPrescriptionResponseFromJson(jsonString);

import 'dart:convert';

UpdateEPrescriptionResponse updateEPrescriptionResponseFromJson(String str) => UpdateEPrescriptionResponse.fromJson(json.decode(str));

String updateEPrescriptionResponseToJson(UpdateEPrescriptionResponse data) => json.encode(data.toJson());

class UpdateEPrescriptionResponse {
  UpdateEPrescriptionResponse({
    required this.message,
    required this.updateEPrescription,
  });

  String message;
  UpdateEPrescription updateEPrescription;

  factory UpdateEPrescriptionResponse.fromJson(Map<String, dynamic> json) => UpdateEPrescriptionResponse(
    message: json["message"],
    updateEPrescription: UpdateEPrescription.fromJson(json["updateEPrescription"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "updateEPrescription": updateEPrescription.toJson(),
  };
}

class UpdateEPrescription {
  UpdateEPrescription({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentScheduleId,
    required this.cc,
    this.oe,
    required this.advice,
    required this.rx,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String userId;
  int doctorId;
  String appointmentScheduleId;
  String cc;
  dynamic oe;
  String advice;
  dynamic rx;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory UpdateEPrescription.fromJson(Map<String, dynamic> json) => UpdateEPrescription(
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
