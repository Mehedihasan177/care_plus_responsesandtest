// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';
SignInResponse signInResponseFromJson(String str) => SignInResponse.fromJson(json.decode(str));
String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory SignInResponse.fromJson(Map<dynamic, dynamic> json) => SignInResponse(
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

  String id;
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
  String status;
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

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"].toString(),
    adminId: json["admin_id"].toString(),
    name: json["name"].toString(),
    email: json["email"].toString(),
    userid: json["userid"].toString(),
    mobile: json["mobile"].toString(),
    dob: json["dob"].toString(),
    address: json["address"].toString(),
    district: json["district"].toString(),
    policeStation: json["police_station"].toString(),
    postOffice: json["post_office"].toString(),
    status: json["status"].toString(),
    referralCode: json["referral_code"].toString(),
    image: json["image"].toString(),
    emailVerifiedAt: json["email_verified_at"].toString(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"].toString(),
    lat: json["lat"].toString(),
    lng: json["lng"].toString(),
    viewPassword: json["view_password"].toString(),
    parentId: json["parent_id"].toString(),
    relationship: json["relationship"].toString(),
    deletedAt: json["deleted_at"].toString(),
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
