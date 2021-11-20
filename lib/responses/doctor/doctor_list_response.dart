// To parse this JSON data, do
//
//     final doctorListResponse = doctorListResponseFromJson(jsonString);

import 'dart:convert';

DoctorListResponse doctorListResponseFromJson(String str) => DoctorListResponse.fromJson(json.decode(str));

String doctorListResponseToJson(DoctorListResponse data) => json.encode(data.toJson());

class DoctorListResponse {
  DoctorListResponse({
    required this.message,
    required this.data,
  });

  String message;
  List<DoctorlistResponse> data;

  factory DoctorListResponse.fromJson(Map<String, dynamic> json) => DoctorListResponse(
    message: json["message"],
    data: List<DoctorlistResponse>.from(json["data"].map((x) => DoctorlistResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DoctorlistResponse {
  DoctorlistResponse({
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
    this.specialization,
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

  String id;
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
  dynamic specialization;
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

  factory DoctorlistResponse.fromJson(Map<String, dynamic> json) => DoctorlistResponse(
    id: json["id"].toString(),
    adminId: json["admin_id"].toString(),
    name: json["name"].toString(),
    email: json["email"].toString(),
    referralCode: json["referral_code"].toString(),
    doctorid: json["doctorid"].toString(),
    mobile: json["mobile"].toString(),
    nid: json["nid"].toString(),
    bmdcReg: json["bmdc_reg"].toString(),
    department: json["department"].toString(),
    degree: json["degree"].toString(),
    designation: json["designation"].toString(),
    specialization: json["specialization"].toString(),
    dob: json["dob"].toString(),
    address: json["address"].toString(),
    district: json["district"].toString(),
    policeStation: json["police_station"].toString(),
    postOffice: json["post_office"].toString(),
    status: json["status"].toString(),
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"].toString(),
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
