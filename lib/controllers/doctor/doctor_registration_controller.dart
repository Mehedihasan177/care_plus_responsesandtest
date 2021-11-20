import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_registration_model.dart';
import 'package:care_plus_responsesandtest/models/user/reg_requst_model.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_registration_responses.dart';
import 'package:http/http.dart' as http;
class DoctorRegistrationController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(DoctorRegReqModel doctorRegReqModel) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor-register';

    Map data1 = {
      'name': "${doctorRegReqModel.name}",
      'email': "${doctorRegReqModel.email}",
      'password': "${doctorRegReqModel.password}",
      'mobile': "${doctorRegReqModel.mobile}",
      'bmdc_reg': "${doctorRegReqModel.bmdc_reg}",
      'password_confirmation': "${doctorRegReqModel.password_confirmation}",
      'image': "${doctorRegReqModel.image}",
      'referral_code': "${doctorRegReqModel.referral_code}",
    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: data1,
        headers: {
          "Accept": "application/json",
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}