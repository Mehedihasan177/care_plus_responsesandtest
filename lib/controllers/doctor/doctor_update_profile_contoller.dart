import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_update_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class DoctorUpdateProfileController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(BuildContext context, DoctorProfileUpdateModel doctorProfileUpdateModel, String token) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor-profile-update';

    Map data1 = {
      'name': "${doctorProfileUpdateModel.name}",
      'nid': "${doctorProfileUpdateModel.nid}",
      'specializations1': "${doctorProfileUpdateModel.specializations1}",
      'specializations2': "${doctorProfileUpdateModel.specializations2}",
      'visit_charge': "${doctorProfileUpdateModel.visit_charge}",
      'image': "${doctorProfileUpdateModel.image}",
    };
    print("token when req: "+token);
    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: data1,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}