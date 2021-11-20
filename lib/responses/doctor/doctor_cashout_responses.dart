// To parse this JSON data, do
//
//     final doctorCashOutResponse = doctorCashOutResponseFromJson(jsonString);

import 'dart:convert';

DoctorCashOutResponse doctorCashOutResponseFromJson(String str) => DoctorCashOutResponse.fromJson(json.decode(str));

String doctorCashOutResponseToJson(DoctorCashOutResponse data) => json.encode(data.toJson());

class DoctorCashOutResponse {
  DoctorCashOutResponse({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory DoctorCashOutResponse.fromJson(Map<String, dynamic> json) => DoctorCashOutResponse(
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
    required this.amount,
    required this.doctorId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String amount;
  int doctorId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    amount: json["amount"],
    doctorId: json["doctor_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "doctor_id": doctorId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
