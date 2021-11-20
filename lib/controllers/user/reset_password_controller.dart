import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/user/reset_password_model.dart';
import 'package:http/http.dart' as http;
class ResetPasswordController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(ResetPasswordModel resetPasswordModel, String token) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user-reset-password';

    Map resetpassword = {
      'mobile': "${resetPasswordModel.mobile}",

    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: resetpassword,
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