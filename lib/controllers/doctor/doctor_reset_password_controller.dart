import 'dart:convert';

import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_reset_password_model.dart';
import 'package:care_plus_responsesandtest/models/user/reset_password_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class DoctorResetPasswordController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(String loginPhone) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor-reset-password';

    Map resetpassword = {
      'mobile': '$loginPhone',

    };
    var body = json.encode(resetpassword);
    // Here we are getting the response
    var response = await http.post(Uri.parse(url),  headers: {"Content-Type": "application/json"}, body: body);

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}