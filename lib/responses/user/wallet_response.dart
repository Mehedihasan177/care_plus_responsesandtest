// To parse this JSON data, do
//
//     final walletResponse = walletResponseFromJson(jsonString);

import 'dart:convert';

WalletResponse walletResponseFromJson(String str) => WalletResponse.fromJson(json.decode(str));

String walletResponseToJson(WalletResponse data) => json.encode(data.toJson());

class WalletResponse {
  WalletResponse({
    required this.message,
    required this.data,
  });

  String message;
  String data;

  factory WalletResponse.fromJson(Map<String, dynamic> json) => WalletResponse(
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
  };
}
