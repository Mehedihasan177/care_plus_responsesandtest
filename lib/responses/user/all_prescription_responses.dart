// To parse this JSON data, do
//
//     final allPrescriptionResponse = allPrescriptionResponseFromJson(jsonString);

import 'dart:convert';

AllPrescriptionResponse allPrescriptionResponseFromJson(String str) => AllPrescriptionResponse.fromJson(json.decode(str));

String allPrescriptionResponseToJson(AllPrescriptionResponse data) => json.encode(data.toJson());

class AllPrescriptionResponse {
  AllPrescriptionResponse({
    required this.report,
    required this.epres,
  });

  List<dynamic> report;
  List<Epre> epres;

  factory AllPrescriptionResponse.fromJson(Map<String, dynamic> json) => AllPrescriptionResponse(
    report: List<dynamic>.from(json["report"].map((x) => x)),
    epres: List<Epre>.from(json["epres"].map((x) => Epre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "report": List<dynamic>.from(report.map((x) => x)),
    "epres": List<dynamic>.from(epres.map((x) => x.toJson())),
  };
}

class Epre {
  Epre({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentScheduleId,
    required this.cc,
    this.oe,
    required this.advice,
    this.rx,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.doctor,
    required this.appointmentSchedule,
  });

  int id;
  int userId;
  int doctorId;
  int appointmentScheduleId;
  String cc;
  dynamic oe;
  String advice;
  dynamic rx;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Doctor doctor;
  AppointmentSchedule appointmentSchedule;

  factory Epre.fromJson(Map<String, dynamic> json) => Epre(
    id: json["id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    appointmentScheduleId: json["appointment_schedule_id"],
    cc: json["cc"],
    oe: json["oe"],
    advice: json["advice"],
    rx: json["rx"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    doctor: Doctor.fromJson(json["doctor"]),
    appointmentSchedule: AppointmentSchedule.fromJson(json["appointment_schedule"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "appointment_schedule_id": appointmentScheduleId,
    "cc": cc,
    "oe": oe,
    "advice": advice,
    "rx": rx,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "doctor": doctor.toJson(),
    "appointment_schedule": appointmentSchedule.toJson(),
  };
}

class AppointmentSchedule {
  AppointmentSchedule({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentSlotId,
    required this.date,
    this.rescheduleDate,
    this.rescheduleSlotId,
    required this.active,
    required this.consult,
    required this.reschedule,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  int userId;
  int doctorId;
  int appointmentSlotId;
  DateTime date;
  dynamic rescheduleDate;
  dynamic rescheduleSlotId;
  int active;
  int consult;
  int reschedule;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory AppointmentSchedule.fromJson(Map<String, dynamic> json) => AppointmentSchedule(
    id: json["id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    appointmentSlotId: json["appointment_slot_id"],
    date: DateTime.parse(json["date"]),
    rescheduleDate: json["reschedule_date"],
    rescheduleSlotId: json["reschedule_slot_id"],
    active: json["active"],
    consult: json["consult"],
    reschedule: json["reschedule"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "appointment_slot_id": appointmentSlotId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "reschedule_date": rescheduleDate,
    "reschedule_slot_id": rescheduleSlotId,
    "active": active,
    "consult": consult,
    "reschedule": reschedule,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

class Doctor {
  Doctor({
    required this.id,
    this.adminId,
    required this.name,
    required this.email,
    required this.referralCode,
    required this.doctorid,
    required this.mobile,
    this.nid,
    required this.bmdcReg,
    this.department,
    this.degree,
    this.designation,
    required this.specialization,
    required this.dob,
    this.address,
    this.district,
    this.policeStation,
    this.postOffice,
    required this.status,
    this.image,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.gender,
    this.deletedAt,
  });

  int id;
  dynamic adminId;
  String name;
  String email;
  String referralCode;
  String doctorid;
  String mobile;
  dynamic nid;
  String bmdcReg;
  dynamic department;
  dynamic degree;
  dynamic designation;
  String specialization;
  DateTime dob;
  dynamic address;
  dynamic district;
  dynamic policeStation;
  dynamic postOffice;
  int status;
  dynamic image;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic gender;
  dynamic deletedAt;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    adminId: json["admin_id"],
    name: json["name"],
    email: json["email"],
    referralCode: json["referral_code"],
    doctorid: json["doctorid"],
    mobile: json["mobile"],
    nid: json["nid"],
    bmdcReg: json["bmdc_reg"],
    department: json["department"],
    degree: json["degree"],
    designation: json["designation"],
    specialization: json["specialization"],
    dob: DateTime.parse(json["dob"]),
    address: json["address"],
    district: json["district"],
    policeStation: json["police_station"],
    postOffice: json["post_office"],
    status: json["status"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "name": name,
    "email": email,
    "referral_code": referralCode,
    "doctorid": doctorid,
    "mobile": mobile,
    "nid": nid,
    "bmdc_reg": bmdcReg,
    "department": department,
    "degree": degree,
    "designation": designation,
    "specialization": specialization,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "address": address,
    "district": district,
    "police_station": policeStation,
    "post_office": postOffice,
    "status": status,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "gender": gender,
    "deleted_at": deletedAt,
  };
}
