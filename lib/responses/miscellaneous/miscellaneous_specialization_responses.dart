// To parse this JSON data, do
//
//     final miscellaneousSpecializationResponse = miscellaneousSpecializationResponseFromJson(jsonString);

import 'dart:convert';

List<MiscellaneousSpecializationResponse> miscellaneousSpecializationResponseFromJson(String str) => List<MiscellaneousSpecializationResponse>.from(json.decode(str).map((x) => MiscellaneousSpecializationResponse.fromJson(x)));

String miscellaneousSpecializationResponseToJson(List<MiscellaneousSpecializationResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MiscellaneousSpecializationResponse {
  MiscellaneousSpecializationResponse({
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

  factory MiscellaneousSpecializationResponse.fromJson(Map<String, dynamic> json) => MiscellaneousSpecializationResponse(
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
