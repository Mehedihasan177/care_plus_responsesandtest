// To parse this JSON data, do
//
//     final doctorDeleteEPrescriptionResponse = doctorDeleteEPrescriptionResponseFromJson(jsonString);

import 'dart:convert';

DoctorDeleteEPrescriptionResponse doctorDeleteEPrescriptionResponseFromJson(String str) => DoctorDeleteEPrescriptionResponse.fromJson(json.decode(str));

String doctorDeleteEPrescriptionResponseToJson(DoctorDeleteEPrescriptionResponse data) => json.encode(data.toJson());

class DoctorDeleteEPrescriptionResponse {
  DoctorDeleteEPrescriptionResponse({
    required this.message,
    required this.data,
  });

  String message;
  String data;

  factory DoctorDeleteEPrescriptionResponse.fromJson(Map<String, dynamic> json) => DoctorDeleteEPrescriptionResponse(
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
  };
}
