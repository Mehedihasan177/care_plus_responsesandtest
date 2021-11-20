import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/user/signIn_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SigninController{

  static Future<http.Response> requestThenResponsePrint(SigninModel signinController) async {

    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user-login';

    Map login = {
      'mobile': "${signinController.mobile}",
      'password': "${signinController.password}",
    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: login,
        headers: {
          "Accept": "application/json",
        }
    );
    Text(response.body);
    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}