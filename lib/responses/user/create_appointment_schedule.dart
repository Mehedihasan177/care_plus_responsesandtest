// To parse this JSON data, do
//
//     final createAppointmentScheduleResponse = createAppointmentScheduleResponseFromJson(jsonString);

import 'dart:convert';

CreateAppointmentScheduleResponse createAppointmentScheduleResponseFromJson(String str) => CreateAppointmentScheduleResponse.fromJson(json.decode(str));

String createAppointmentScheduleResponseToJson(CreateAppointmentScheduleResponse data) => json.encode(data.toJson());

class CreateAppointmentScheduleResponse {
  CreateAppointmentScheduleResponse({
    required this.message,
    required this.createAppointmentSchedule,
  });

  String message;
  CreateAppointmentSchedule createAppointmentSchedule;

  factory CreateAppointmentScheduleResponse.fromJson(Map<String, dynamic> json) => CreateAppointmentScheduleResponse(
    message: json["message"],
    createAppointmentSchedule: CreateAppointmentSchedule.fromJson(json["CreateAppointmentSchedule"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "CreateAppointmentSchedule": createAppointmentSchedule.toJson(),
  };
}

class CreateAppointmentSchedule {
  CreateAppointmentSchedule({
    required this.doctorId,
    required this.appointmentSlotId,
    required this.date,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.appointmentSlot,
    required this.doctor,
    required this.user,
  });

  int doctorId;
  String appointmentSlotId;
  DateTime date;
  int userId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  AppointmentSlot appointmentSlot;
  Doctor doctor;
  User user;

  factory CreateAppointmentSchedule.fromJson(Map<String, dynamic> json) => CreateAppointmentSchedule(
    doctorId: json["doctor_id"],
    appointmentSlotId: json["appointment_slot_id"],
    date: DateTime.parse(json["date"]),
    userId: json["user_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    appointmentSlot: AppointmentSlot.fromJson(json["appointment_slot"]),
    doctor: Doctor.fromJson(json["doctor"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "doctor_id": doctorId,
    "appointment_slot_id": appointmentSlotId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "user_id": userId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "appointment_slot": appointmentSlot.toJson(),
    "doctor": doctor.toJson(),
    "user": user.toJson(),
  };
}

class AppointmentSlot {
  AppointmentSlot({
    required this.id,
    required this.doctorId,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  int doctorId;
  String startTime;
  String endTime;
  String day;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory AppointmentSlot.fromJson(Map<String, dynamic> json) => AppointmentSlot(
    id: json["id"],
    doctorId: json["doctor_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    day: json["day"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "start_time": startTime,
    "end_time": endTime,
    "day": day,
    "status": status,
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
    specialization: json["specialization"],
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
    required this.email,
    required this.userid,
    required this.mobile,
    required this.dob,
    required this.address,
    required this.district,
    required this.policeStation,
    required this.postOffice,
    required this.status,
    required this.referralCode,
    this.image,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.gender,
    required this.lat,
    required this.lng,
    required this.viewPassword,
    this.parentId,
    this.relationship,
    this.deletedAt,
  });

  int id;
  dynamic adminId;
  String name;
  String email;
  String userid;
  String mobile;
  dynamic dob;
  String address;
  dynamic district;
  dynamic policeStation;
  dynamic postOffice;
  int status;
  String referralCode;
  dynamic image;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic gender;
  String lat;
  String lng;
  String viewPassword;
  dynamic parentId;
  dynamic relationship;
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
    status: json["status"],
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
