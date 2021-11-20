// To parse this JSON data, do
//
//     final doctorAppointmentDoneResponse = doctorAppointmentDoneResponseFromJson(jsonString);

import 'dart:convert';

DoctorAppointmentDoneResponse doctorAppointmentDoneResponseFromJson(String str) => DoctorAppointmentDoneResponse.fromJson(json.decode(str));

String doctorAppointmentDoneResponseToJson(DoctorAppointmentDoneResponse data) => json.encode(data.toJson());

class DoctorAppointmentDoneResponse {
  DoctorAppointmentDoneResponse({
    required this.message,
    required this.doctorAppointmentDoneResponses,
  });

  String message;
  DoctorAppointmentDoneResponses doctorAppointmentDoneResponses;

  factory DoctorAppointmentDoneResponse.fromJson(Map<String, dynamic> json) => DoctorAppointmentDoneResponse(
    message: json["message"],
    doctorAppointmentDoneResponses: DoctorAppointmentDoneResponses.fromJson(json["DoctorAppointmentDoneResponses"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DoctorAppointmentDoneResponses": doctorAppointmentDoneResponses.toJson(),
  };
}

class DoctorAppointmentDoneResponses {
  DoctorAppointmentDoneResponses({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentSlotId,
    required this.date,
    this.rescheduleDate,
    this.rescheduleSlotId,
    required this.active,
    required this.consult,
    required this.reschedule,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  int userId;
  int doctorId;
  int appointmentSlotId;
  DateTime date;
  dynamic rescheduleDate;
  dynamic rescheduleSlotId;
  int active;
  int consult;
  int reschedule;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory DoctorAppointmentDoneResponses.fromJson(Map<String, dynamic> json) => DoctorAppointmentDoneResponses(
    id: json["id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    appointmentSlotId: json["appointment_slot_id"],
    date: DateTime.parse(json["date"]),
    rescheduleDate: json["reschedule_date"],
    rescheduleSlotId: json["reschedule_slot_id"],
    active: json["active"],
    consult: json["consult"],
    reschedule: json["reschedule"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "appointment_slot_id": appointmentSlotId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "reschedule_date": rescheduleDate,
    "reschedule_slot_id": rescheduleSlotId,
    "active": active,
    "consult": consult,
    "reschedule": reschedule,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
