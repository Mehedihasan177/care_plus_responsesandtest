// To parse this JSON data, do
//
//     final doctorWalletRechargeResponse = doctorWalletRechargeResponseFromJson(jsonString);

import 'dart:convert';

DoctorWalletRechargeResponse doctorWalletRechargeResponseFromJson(String str) => DoctorWalletRechargeResponse.fromJson(json.decode(str));

String doctorWalletRechargeResponseToJson(DoctorWalletRechargeResponse data) => json.encode(data.toJson());

class DoctorWalletRechargeResponse {
  DoctorWalletRechargeResponse({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory DoctorWalletRechargeResponse.fromJson(Map<String, dynamic> json) => DoctorWalletRechargeResponse(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.doctorId,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String doctorId;
  int balance;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
