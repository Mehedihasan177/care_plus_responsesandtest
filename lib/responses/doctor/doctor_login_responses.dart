// To parse this JSON data, do
//
//     final doctorLoginResponse = doctorLoginResponseFromJson(jsonString);

import 'dart:convert';

DoctorLoginResponse doctorLoginResponseFromJson(String str) => DoctorLoginResponse.fromJson(json.decode(str));

String doctorLoginResponseToJson(DoctorLoginResponse data) => json.encode(data.toJson());

class DoctorLoginResponse {
  DoctorLoginResponse({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory DoctorLoginResponse.fromJson(Map<String, dynamic> json) => DoctorLoginResponse(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.id,
    required this.token,
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
  String token;
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
  String createdAt;
  String updatedAt;
  dynamic gender;
  dynamic deletedAt;

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
    id: json["id"].toString(),
    token: json["token"].toString(),
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
    status: json["status"].toString().toString(),
    image: json["image"].toString().toString(),
    emailVerifiedAt: json["email_verified_at"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
    gender: json["gender"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
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
    "created_at": createdAt.toString(),
    "updated_at": updatedAt.toString(),
    "gender": gender,
    "deleted_at": deletedAt,
  };
}
