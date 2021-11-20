// To parse this JSON data, do
//
//     final doctorbyIdResponse = doctorbyIdResponseFromJson(jsonString);

import 'dart:convert';

DoctorbyIdResponse doctorbyIdResponseFromJson(String str) => DoctorbyIdResponse.fromJson(json.decode(str));

String doctorbyIdResponseToJson(DoctorbyIdResponse data) => json.encode(data.toJson());

class DoctorbyIdResponse {
  DoctorbyIdResponse({
    required this.message,
    required this.doctorbyId,
  });

  String message;
  List<DoctorbyId> doctorbyId;

  factory DoctorbyIdResponse.fromJson(Map<String, dynamic> json) => DoctorbyIdResponse(
    message: json["message"],
    doctorbyId: List<DoctorbyId>.from(json["DoctorbyID"].map((x) => DoctorbyId.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DoctorbyID": List<dynamic>.from(doctorbyId.map((x) => x.toJson())),
  };
}

class DoctorbyId {
  DoctorbyId({
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
    required this.appointmentSlot,
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
  String status;
  dynamic image;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic gender;
  dynamic deletedAt;
  List<AppointmentSlot> appointmentSlot;

  factory DoctorbyId.fromJson(Map<String, dynamic> json) => DoctorbyId(
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
    status: (json["status"]),
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"],
    deletedAt: json["deleted_at"],
    appointmentSlot: List<AppointmentSlot>.from(json["appointment_slot"].map((x) => AppointmentSlot.fromJson(x))),
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
    "appointment_slot": List<dynamic>.from(appointmentSlot.map((x) => x.toJson())),
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
