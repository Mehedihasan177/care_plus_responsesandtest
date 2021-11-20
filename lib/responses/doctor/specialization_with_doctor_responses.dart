// To parse this JSON data, do
//
//     final specializationWithDoctorResponse = specializationWithDoctorResponseFromJson(jsonString);

import 'dart:convert';

List<SpecializationWithDoctorResponse> specializationWithDoctorResponseFromJson(String str) => List<SpecializationWithDoctorResponse>.from(json.decode(str).map((x) => SpecializationWithDoctorResponse.fromJson(x)));

String specializationWithDoctorResponseToJson(List<SpecializationWithDoctorResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpecializationWithDoctorResponse {
  SpecializationWithDoctorResponse({
    required this.id,
    required this.name,
    required this.icon,
    required this.priority,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String icon;
  int priority;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory SpecializationWithDoctorResponse.fromJson(Map<String, dynamic> json) => SpecializationWithDoctorResponse(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    priority: json["priority"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "priority": priority,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
