import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/user/reg_requst_model.dart';
import 'package:care_plus_responsesandtest/responses/user/child_by_health_id_responses.dart';
import 'package:care_plus_responsesandtest/responses/user/seperate_child_responses.dart';
import 'package:http/http.dart' as http;
class SeperateChildController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(SeperatechildModel seperatechildModel, String token) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user/child/3';

    Map seperatechild = {
      'id': "${seperatechildModel.id}",
      'viewpassword': "${seperatechildModel.viewPassword}",
      'email': "${seperatechildModel.email}",

    };

    // Here we are getting the response
    var response = await http.put(Uri.parse(url), body: seperatechild,
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