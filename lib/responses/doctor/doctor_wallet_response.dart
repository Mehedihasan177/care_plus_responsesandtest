// To parse this JSON data, do
//
//     final doctorWalletResponse = doctorWalletResponseFromJson(jsonString);

import 'dart:convert';

DoctorWalletResponse doctorWalletResponseFromJson(String str) => DoctorWalletResponse.fromJson(json.decode(str));

String doctorWalletResponseToJson(DoctorWalletResponse data) => json.encode(data.toJson());

class DoctorWalletResponse {
  DoctorWalletResponse({
    required this.message,
    required this.data,
  });

  String message;
  String data;

  factory DoctorWalletResponse.fromJson(Map<String, dynamic> json) => DoctorWalletResponse(
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
  };
}
