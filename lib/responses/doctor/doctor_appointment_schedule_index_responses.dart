// To parse this JSON data, do
//
//     final doctorAppointmentScheduleIndexResponse = doctorAppointmentScheduleIndexResponseFromJson(jsonString);

import 'dart:convert';

DoctorAppointmentScheduleIndexResponse doctorAppointmentScheduleIndexResponseFromJson(String str) => DoctorAppointmentScheduleIndexResponse.fromJson(json.decode(str));

String doctorAppointmentScheduleIndexResponseToJson(DoctorAppointmentScheduleIndexResponse data) => json.encode(data.toJson());

class DoctorAppointmentScheduleIndexResponse {
  DoctorAppointmentScheduleIndexResponse({
    required this.message,
    required this.doctorAppointmentScheduleIndex,
  });

  String message;
  List<DoctorAppointmentScheduleIndex> doctorAppointmentScheduleIndex;

  factory DoctorAppointmentScheduleIndexResponse.fromJson(Map<String, dynamic> json) => DoctorAppointmentScheduleIndexResponse(
    message: json["message"],
    doctorAppointmentScheduleIndex: List<DoctorAppointmentScheduleIndex>.from(json["DoctorAppointmentScheduleIndex"].map((x) => DoctorAppointmentScheduleIndex.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DoctorAppointmentScheduleIndex": List<dynamic>.from(doctorAppointmentScheduleIndex.map((x) => x.toJson())),
  };
}

class DoctorAppointmentScheduleIndex {
  DoctorAppointmentScheduleIndex({
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
    required this.user,
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
  User user;

  factory DoctorAppointmentScheduleIndex.fromJson(Map<String, dynamic> json) => DoctorAppointmentScheduleIndex(
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
    user: User.fromJson(json["user"]),
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
    "user": user.toJson(),
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
  int status;
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
