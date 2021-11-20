// // To parse this JSON data, do
// //
// //     final createEPrescriptionResponse = createEPrescriptionResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// CreateEPrescriptionResponse createEPrescriptionResponseFromJson(String str) => CreateEPrescriptionResponse.fromJson(json.decode(str));
//
// String createEPrescriptionResponseToJson(CreateEPrescriptionResponse data) => json.encode(data.toJson());
//
// class CreateEPrescriptionResponse {
//   CreateEPrescriptionResponse({
//     required this.message,
//     required this.ePrescription,
//   });
//
//   String message;
//   EPrescription ePrescription;
//
//   factory CreateEPrescriptionResponse.fromJson(Map<String, dynamic> json) => CreateEPrescriptionResponse(
//     message: json["message"],
//     ePrescription: EPrescription.fromJson(json["EPrescription"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "EPrescription": ePrescription.toJson(),
//   };
// }
//
// class EPrescription {
//   EPrescription({
//     required this.userId,
//     required this.appointmentScheduleId,
//     required this.advice,
//     required this.cc,
//     required this.doctorId,
//     required this.updatedAt,
//     required this.createdAt,
//     required this.id,
//   });
//
//   int userId;
//   String appointmentScheduleId;
//   String advice;
//   String cc;
//   int doctorId;
//   DateTime updatedAt;
//   DateTime createdAt;
//   int id;
//
//   factory EPrescription.fromJson(Map<String, dynamic> json) => EPrescription(
//     userId: json["user_id"],
//     appointmentScheduleId: json["appointment_schedule_id"],
//     advice: json["advice"],
//     cc: json["cc"],
//     doctorId: json["doctor_id"],
//     updatedAt: DateTime.parse(json["updated_at"]),
//     createdAt: DateTime.parse(json["created_at"]),
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user_id": userId,
//     "appointment_schedule_id": appointmentScheduleId,
//     "advice": advice,
//     "cc": cc,
//     "doctor_id": doctorId,
//     "updated_at": updatedAt.toIso8601String(),
//     "created_at": createdAt.toIso8601String(),
//     "id": id,
//   };
// }


class CreateEPrescriptionModel{
  late String userId;
  late String appointment_schedule_id;
  late String advice;
  late String cc;
  late String doctorId;
  late String updatedAt;
  late String createdAt;
  late String id;
  CreateEPrescriptionModel({
    required this.userId,
    required this.appointment_schedule_id,
    required this.advice,
    required this.cc,
    required this.doctorId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
});
}