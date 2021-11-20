// To parse this JSON data, do
//
//     final doctorWalletLogResponse = doctorWalletLogResponseFromJson(jsonString);

import 'dart:convert';

DoctorWalletLogResponse doctorWalletLogResponseFromJson(String str) => DoctorWalletLogResponse.fromJson(json.decode(str));

String doctorWalletLogResponseToJson(DoctorWalletLogResponse data) => json.encode(data.toJson());

class DoctorWalletLogResponse {
  DoctorWalletLogResponse({
    required this.doctorWalletLogResponses,
  });

  List<DoctorWalletLogResponseElement> doctorWalletLogResponses;

  factory DoctorWalletLogResponse.fromJson(Map<String, dynamic> json) => DoctorWalletLogResponse(
    doctorWalletLogResponses: List<DoctorWalletLogResponseElement>.from(json["DoctorWalletLogResponses"].map((x) => DoctorWalletLogResponseElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "DoctorWalletLogResponses": List<dynamic>.from(doctorWalletLogResponses.map((x) => x.toJson())),
  };
}

class DoctorWalletLogResponseElement {
  DoctorWalletLogResponseElement({
    required this.id,
    required this.trxId,
    this.userId,
    required this.doctorId,
    this.serviceProviderId,
    required this.type,
    required this.amount,
    required this.deposit,
    required this.paymentGateway,
    required this.paymentNote,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String trxId;
  dynamic userId;
  int doctorId;
  dynamic serviceProviderId;
  String type;
  int amount;
  int deposit;
  String paymentGateway;
  String paymentNote;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory DoctorWalletLogResponseElement.fromJson(Map<String, dynamic> json) => DoctorWalletLogResponseElement(
    id: json["id"],
    trxId: json["trx_id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    serviceProviderId: json["service_provider_id"],
    type: json["type"],
    amount: json["amount"],
    deposit: json["deposit"],
    paymentGateway: json["payment_gateway"],
    paymentNote: json["payment_note"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "trx_id": trxId,
    "user_id": userId,
    "doctor_id": doctorId,
    "service_provider_id": serviceProviderId,
    "type": type,
    "amount": amount,
    "deposit": deposit,
    "payment_gateway": paymentGateway,
    "payment_note": paymentNote,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
