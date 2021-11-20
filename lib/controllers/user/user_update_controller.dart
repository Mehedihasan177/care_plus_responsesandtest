import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/user/reg_requst_model.dart';
import 'package:care_plus_responsesandtest/models/user/user_update_model.dart';
import 'package:http/http.dart' as http;
class UserUpdateController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(UpdateReqModel updateReqModel) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user-profile-update';

    Map data1 = {
      'name': "${updateReqModel.name}",
      'email': "${updateReqModel.email}",
      'password': "${updateReqModel.password}",
      'mobile': "${updateReqModel.mobile}",
      'address': "${updateReqModel.address}",
      'Password_confirmation': "${updateReqModel.password_confirmation}",
      'image': "${updateReqModel.image}",
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