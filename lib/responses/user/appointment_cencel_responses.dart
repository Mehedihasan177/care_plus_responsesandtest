// To parse this JSON data, do
//
//     final appointmentCencelResponse = appointmentCencelResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

AppointmentCencelResponse appointmentCencelResponseFromJson(String str) => AppointmentCencelResponse.fromJson(json.decode(str));

String appointmentCencelResponseToJson(AppointmentCencelResponse data) => json.encode(data.toJson());

class AppointmentCencelResponse {
  AppointmentCencelResponse({
    required this.message,
    required this.appintmentCanel,
  });

  String message;
  AppintmentCanel appintmentCanel;

  factory AppointmentCencelResponse.fromJson(Map<String, dynamic> json) => AppointmentCencelResponse(
    message: json["message"],
    appintmentCanel: AppintmentCanel.fromJson(json["appintmentCanel"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "appintmentCanel": appintmentCanel.toJson(),
  };
}

class AppintmentCanel {
  AppintmentCanel({
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
    required this.navigator,
  });

  String id;
  String userId;
  String doctorId;
  String appointmentSlotId;
  DateTime date;
  dynamic rescheduleDate;
  dynamic rescheduleSlotId;
  String active;
  String consult;
  String reschedule;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  GlobalKey<NavigatorState> navigator;

  factory AppintmentCanel.fromJson(Map<String, dynamic> json) => AppintmentCanel(
    id: json["id"],
    navigator: json["navigator"],
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
