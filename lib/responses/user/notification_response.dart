// To parse this JSON data, do
//
//     final notifcationResponse = notifcationResponseFromJson(jsonString);

import 'dart:convert';

NotifcationResponse notifcationResponseFromJson(String str) => NotifcationResponse.fromJson(json.decode(str));

String notifcationResponseToJson(NotifcationResponse data) => json.encode(data.toJson());

class NotifcationResponse {
  NotifcationResponse({
    required this.data,
  });

  List<Datum> data;

  factory NotifcationResponse.fromJson(Map<String, dynamic> json) => NotifcationResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    this.doctorId,
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
  String userId;
  dynamic doctorId;
  dynamic pharmacyId;
  dynamic serviceProviderId;
  dynamic type;
  String title;
  String body;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
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
