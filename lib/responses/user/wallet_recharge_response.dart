// To parse this JSON data, do
//
//     final walletRechargeResponse = walletRechargeResponseFromJson(jsonString);

import 'dart:convert';

WalletRechargeResponse walletRechargeResponseFromJson(String str) => WalletRechargeResponse.fromJson(json.decode(str));

String walletRechargeResponseToJson(WalletRechargeResponse data) => json.encode(data.toJson());

class WalletRechargeResponse {
  WalletRechargeResponse({
    required this.message,
    required this.data,
  });

  String message;
  int data;

  factory WalletRechargeResponse.fromJson(Map<String, dynamic> json) => WalletRechargeResponse(
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
  };
}
