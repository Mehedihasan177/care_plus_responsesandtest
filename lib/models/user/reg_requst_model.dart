import 'dart:core';

class RegReqModel {
  String name;
  String email;
  String password;
  String mobile;
  String address;
  String password_confirmation;
  String image;

  RegReqModel({
    required this.name,
    required this.email,
    required this.password,
    required this.mobile,
    required this.address,
    required this.password_confirmation,
    required this.image,
  });
}
