import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/user/reg_requst_model.dart';
import 'package:http/http.dart' as http;
class RegistrationController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(RegReqModel information) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user-register';

    Map data1 = {
      'name': "${information.name}",
      'email': "${information.email}",
      'password': "${information.password}",
      'mobile': "${information.mobile}",
      'address': "${information.address}",
      'password_confirmation': "${information.password_confirmation}",
      'image': "${information.image}",
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