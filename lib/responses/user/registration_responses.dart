// To parse this JSON data, do
//
//     final userRegistrationResponse = userRegistrationResponseFromJson(jsonString);

import 'dart:convert';

UserRegistrationResponse userRegistrationResponseFromJson(String str) => UserRegistrationResponse.fromJson(json.decode(str));

String userRegistrationResponseToJson(UserRegistrationResponse data) => json.encode(data.toJson());

class UserRegistrationResponse {
  UserRegistrationResponse({
    required this.userRegistration,
    required this.token,
  });

  UserRegistration userRegistration;
  String token;

  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json) => UserRegistrationResponse(
    userRegistration: UserRegistration.fromJson(json["UserRegistration"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "UserRegistration": userRegistration.toJson(),
    "token": token,
  };
}

class UserRegistration {
  UserRegistration({
    required this.id,
    this.adminId,
    required this.name,
    required this.email,
    required this.userid,
    required this.mobile,
    this.dob,
    required this.address,
    this.district,
    this.policeStation,
    this.postOffice,
    required this.status,
    required this.referralCode,
    required this.image,
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
  String image;
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

  factory UserRegistration.fromJson(Map<String, dynamic> json) => UserRegistration(
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
