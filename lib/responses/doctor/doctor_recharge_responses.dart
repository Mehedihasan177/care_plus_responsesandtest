// To parse this JSON data, do
//
//     final doctorRechargeResponse = doctorRechargeResponseFromJson(jsonString);

import 'dart:convert';

DoctorRechargeResponse doctorRechargeResponseFromJson(String str) => DoctorRechargeResponse.fromJson(json.decode(str));

String doctorRechargeResponseToJson(DoctorRechargeResponse data) => json.encode(data.toJson());

class DoctorRechargeResponse {
  DoctorRechargeResponse({
    required this.message,
    required this.doctorRecharge,
  });

  String message;
  DoctorRecharge doctorRecharge;

  factory DoctorRechargeResponse.fromJson(Map<String, dynamic> json) => DoctorRechargeResponse(
    message: json["message"],
    doctorRecharge: DoctorRecharge.fromJson(json["DoctorRecharge"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DoctorRecharge": doctorRecharge.toJson(),
  };
}

class DoctorRecharge {
  DoctorRecharge({
    required this.id,
    required this.doctorId,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  int doctorId;
  int balance;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory DoctorRecharge.fromJson(Map<String, dynamic> json) => DoctorRecharge(
    id: json["id"],
    doctorId: json["doctor_id"],
    balance: json["balance"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "balance": balance,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
