// To parse this JSON data, do
//
//     final doctorIndexResponse = doctorIndexResponseFromJson(jsonString);

import 'dart:convert';

DoctorIndexResponse doctorIndexResponseFromJson(String str) => DoctorIndexResponse.fromJson(json.decode(str));

String doctorIndexResponseToJson(DoctorIndexResponse data) => json.encode(data.toJson());

class DoctorIndexResponse {
  DoctorIndexResponse({
    required this.message,
    required this.doctorIndexResponses,
  });

  String message;
  List<DoctorIndexResponseElement> doctorIndexResponses;

  factory DoctorIndexResponse.fromJson(Map<String, dynamic> json) => DoctorIndexResponse(
    message: json["message"],
    doctorIndexResponses: List<DoctorIndexResponseElement>.from(json["DoctorIndexResponses"].map((x) => DoctorIndexResponseElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DoctorIndexResponses": List<dynamic>.from(doctorIndexResponses.map((x) => x.toJson())),
  };
}

class DoctorIndexResponseElement {
  DoctorIndexResponseElement({
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

  factory DoctorIndexResponseElement.fromJson(Map<String, dynamic> json) => DoctorIndexResponseElement(
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
