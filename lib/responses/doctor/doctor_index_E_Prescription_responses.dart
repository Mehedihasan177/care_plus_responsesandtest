// To parse this JSON data, do
//
//     final doctorEprescriptionIndexResponse = doctorEprescriptionIndexResponseFromJson(jsonString);

import 'dart:convert';

DoctorEprescriptionIndexResponse doctorEprescriptionIndexResponseFromJson(String str) => DoctorEprescriptionIndexResponse.fromJson(json.decode(str));

String doctorEprescriptionIndexResponseToJson(DoctorEprescriptionIndexResponse data) => json.encode(data.toJson());

class DoctorEprescriptionIndexResponse {
  DoctorEprescriptionIndexResponse({
    required this.message,
    required this.doctorEprescriptionIndexResponse,
  });

  String message;
  List<DoctorEprescriptionIndexResponseElement> doctorEprescriptionIndexResponse;

  factory DoctorEprescriptionIndexResponse.fromJson(Map<String, dynamic> json) => DoctorEprescriptionIndexResponse(
    message: json["message"],
    doctorEprescriptionIndexResponse: List<DoctorEprescriptionIndexResponseElement>.from(json["DoctorEprescriptionIndexResponse"].map((x) => DoctorEprescriptionIndexResponseElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DoctorEprescriptionIndexResponse": List<dynamic>.from(doctorEprescriptionIndexResponse.map((x) => x.toJson())),
  };
}

class DoctorEprescriptionIndexResponseElement {
  DoctorEprescriptionIndexResponseElement({
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
    required this.user,
    required this.appointmentSchedule,
  });

  String id;
  String userId;
  String doctorId;
  String appointmentScheduleId;
  String cc;
  dynamic oe;
  String advice;
  dynamic rx;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String doctor;
  String user;
  AppointmentSchedule appointmentSchedule;

  factory DoctorEprescriptionIndexResponseElement.fromJson(Map<String, dynamic> json) => DoctorEprescriptionIndexResponseElement(
    id: json["id"].toString(),
    userId: json["user_id"].toString(),
    doctorId: json["doctor_id"].toString(),
    appointmentScheduleId: json["appointment_schedule_id"].toString(),
    cc: json["cc"],
    oe: json["oe"],
    advice: json["advice"],
    rx: json["rx"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    doctor: json["doctor"].toString(),
    user: json["user"].toString(),
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
    "doctor": doctor,
    "user": user,
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

  String id;
  String userId;
  String doctorId;
  String appointmentSlotId;
  DateTime date;
  dynamic rescheduleDate;
  dynamic rescheduleSlotId;
  String active;
  String consult;
  String reschedule;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory AppointmentSchedule.fromJson(Map<String, dynamic> json) => AppointmentSchedule(
    id: json["id"].toString(),
    userId: json["user_id"].toString(),
    doctorId: json["doctor_id"].toString(),
    appointmentSlotId: json["appointment_slot_id"].toString(),
    date: DateTime.parse(json["date"]),
    rescheduleDate: json["reschedule_date"],
    rescheduleSlotId: json["reschedule_slot_id"],
    active: json["active"].toString(),
    consult: json["consult"].toString(),
    reschedule: json["reschedule"].toString(),
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
    this.dob,
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
  dynamic dob;
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
    specialization: json["specialization"].toString(),
    dob: json["dob"],
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
    "dob": dob,
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

class User {
  User({
    required this.id,
    this.adminId,
    required this.name,
    this.email,
    required this.userid,
    required this.mobile,
    this.dob,
    required this.address,
    this.district,
    this.policeStation,
    this.postOffice,
    required this.status,
    required this.referralCode,
    this.image,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.gender,
    this.lat,
    this.lng,
    required this.viewPassword,
    required this.parentId,
    required this.relationship,
    this.deletedAt,
  });

  int id;
  dynamic adminId;
  String name;
  dynamic email;
  String userid;
  String mobile;
  dynamic dob;
  String address;
  dynamic district;
  dynamic policeStation;
  dynamic postOffice;
  String status;
  String referralCode;
  dynamic image;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String gender;
  dynamic lat;
  dynamic lng;
  String viewPassword;
  int parentId;
  String relationship;
  dynamic deletedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    adminId: json["admin_id"],
    name: json["name"],
    email: json["email"],
    userid: json["userid"],
    mobile: json["mobile"],
    dob: json["dob"],
    address: json["address"],
    district: json["district"],
    policeStation: json["police_station"],
    postOffice: json["post_office"],
    status: json["status"].toString(),
    referralCode: json["referral_code"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"],
    lat: json["lat"],
    lng: json["lng"],
    viewPassword: json["view_password"],
    parentId: json["parent_id"],
    relationship: json["relationship"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "name": name,
    "email": email,
    "userid": userid,
    "mobile": mobile,
    "dob": dob,
    "address": address,
    "district": district,
    "police_station": policeStation,
    "post_office": postOffice,
    "status": status,
    "referral_code": referralCode,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "gender": gender,
    "lat": lat,
    "lng": lng,
    "view_password": viewPassword,
    "parent_id": parentId,
    "relationship": relationship,
    "deleted_at": deletedAt,
  };
}
