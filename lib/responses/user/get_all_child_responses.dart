// To parse this JSON data, do
//
//     final getAllChildResponse = getAllChildResponseFromJson(jsonString);

import 'dart:convert';

GetAllChildResponse getAllChildResponseFromJson(String str) => GetAllChildResponse.fromJson(json.decode(str));

String getAllChildResponseToJson(GetAllChildResponse data) => json.encode(data.toJson());

class GetAllChildResponse {
  GetAllChildResponse({
    this.parent,
    required this.childs,
  });

  dynamic parent;
  List<Child> childs;

  factory GetAllChildResponse.fromJson(Map<String, dynamic> json) => GetAllChildResponse(
    parent: json["parent"],
    childs: List<Child>.from(json["childs"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "parent": parent,
    "childs": List<dynamic>.from(childs.map((x) => x.toJson())),
  };
}

class Child {
  Child({
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

  factory Child.fromJson(Map<String, dynamic> json) => Child(
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
