import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_sinIn_model.dart';
import 'package:http/http.dart' as http;

class DoctorSigninController{

  static Future<http.Response> requestThenResponsePrint(DoctorSignInModel doctorSignInModel) async {

    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor-login';

    Map login = {
      'mobile': "${doctorSignInModel.mobile}",
      'password': "${doctorSignInModel.password}",
    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: login,
        headers: {
          "Accept": "application/json",
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}