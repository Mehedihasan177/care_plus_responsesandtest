// To parse this JSON data, do
//
//     final walletLogResponse = walletLogResponseFromJson(jsonString);

import 'dart:convert';

WalletLogResponse walletLogResponseFromJson(String str) => WalletLogResponse.fromJson(json.decode(str));

String walletLogResponseToJson(WalletLogResponse data) => json.encode(data.toJson());

class WalletLogResponse {
  WalletLogResponse({
    required this.walletLog,
  });

  List<WalletLogResponses> walletLog;

  factory WalletLogResponse.fromJson(Map<String, dynamic> json) => WalletLogResponse(
    walletLog: List<WalletLogResponses>.from(json["WalletLog"].map((x) => WalletLogResponses.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "WalletLog": List<dynamic>.from(walletLog.map((x) => x.toJson())),
  };
}

class WalletLogResponses {
  WalletLogResponses({
    required this.id,
    required this.trxId,
    required this.userId,
    this.doctorId,
    this.serviceProviderId,
    this.type,
    required this.amount,
    required this.deposit,
    required this.paymentGateway,
    required this.paymentNote,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String trxId;
  int userId;
  dynamic doctorId;
  dynamic serviceProviderId;
  dynamic type;
  int amount;
  int deposit;
  String paymentGateway;
  String paymentNote;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory WalletLogResponses.fromJson(Map<dynamic, dynamic> json) => WalletLogResponses(
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
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
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
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
