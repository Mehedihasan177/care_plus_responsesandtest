// To parse this JSON data, do
//
//     final miscellaneousSpecializationWithDoctorResponse = miscellaneousSpecializationWithDoctorResponseFromJson(jsonString);

import 'dart:convert';

List<MiscellaneousSpecializationWithDoctorResponse> miscellaneousSpecializationWithDoctorResponseFromJson(String str) => List<MiscellaneousSpecializationWithDoctorResponse>.from(json.decode(str).map((x) => MiscellaneousSpecializationWithDoctorResponse.fromJson(x)));

String miscellaneousSpecializationWithDoctorResponseToJson(List<MiscellaneousSpecializationWithDoctorResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MiscellaneousSpecializationWithDoctorResponse {
  MiscellaneousSpecializationWithDoctorResponse({
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

  factory MiscellaneousSpecializationWithDoctorResponse.fromJson(Map<String, dynamic> json) => MiscellaneousSpecializationWithDoctorResponse(
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
