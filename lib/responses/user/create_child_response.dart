// To parse this JSON data, do
//
//     final accountCreationResponse = accountCreationResponseFromJson(jsonString);

import 'dart:convert';

AccountCreationResponse accountCreationResponseFromJson(String str) => AccountCreationResponse.fromJson(json.decode(str));

String accountCreationResponseToJson(AccountCreationResponse data) => json.encode(data.toJson());

class AccountCreationResponse {
  AccountCreationResponse({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory AccountCreationResponse.fromJson(Map<String, dynamic> json) => AccountCreationResponse(
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
    required this.id,
    required this.adminId,
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
    required this.lat,
    required this.lng,
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
  String lat;
  String lng;
  String viewPassword;
  int parentId;
  String relationship;
  dynamic deletedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
