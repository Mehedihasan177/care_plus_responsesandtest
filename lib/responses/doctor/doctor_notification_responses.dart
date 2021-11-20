// To parse this JSON data, do
//
//     final doctorNotificationResponse = doctorNotificationResponseFromJson(jsonString);

import 'dart:convert';

DoctorNotificationResponse doctorNotificationResponseFromJson(String str) => DoctorNotificationResponse.fromJson(json.decode(str));

String doctorNotificationResponseToJson(DoctorNotificationResponse data) => json.encode(data.toJson());

class DoctorNotificationResponse {
  DoctorNotificationResponse({
    required this.doctornotification,
  });

  List<Doctornotification> doctornotification;

  factory DoctorNotificationResponse.fromJson(Map<String, dynamic> json) => DoctorNotificationResponse(
    doctornotification: List<Doctornotification>.from(json["Doctornotification"].map((x) => Doctornotification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Doctornotification": List<dynamic>.from(doctornotification.map((x) => x.toJson())),
  };
}

class Doctornotification {
  Doctornotification({
    required this.id,
    this.userId,
    required this.doctorId,
    this.pharmacyId,
    this.serviceProviderId,
    this.type,
    required this.title,
    required this.body,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  String id;
  dynamic userId;
  String doctorId;
  dynamic pharmacyId;
  dynamic serviceProviderId;
  dynamic type;
  String title;
  String body;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Doctornotification.fromJson(Map<String, dynamic> json) => Doctornotification(
    id: json["id"].toString(),
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    pharmacyId: json["pharmacy_id"],
    serviceProviderId: json["service_provider_id"],
    type: json["type"],
    title: json["title"],
    body: json["body"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "pharmacy_id": pharmacyId,
    "service_provider_id": serviceProviderId,
    "type": type,
    "title": title,
    "body": body,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
