import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/user/change_password_model.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_change_password_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;




class DoctorChangePasswordController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(BuildContext context, token, DoctorPasswordChangeModel pass) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor-change-password';
    print(url);



    // This is the structure how we are posting data
    Map data1 = {
      "oldpassword": "${pass.oldpassword}",
      "password": "${pass.password}",
      "password_confirmation": "${pass.confirmPassword}"
    };
    print(data1);
    print("token when req: "+token);



    // Here we are getting the response
    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${token}"

        }, body: data1);

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    print(response.statusCode);
    print(response.body);
    return response;
  }

}