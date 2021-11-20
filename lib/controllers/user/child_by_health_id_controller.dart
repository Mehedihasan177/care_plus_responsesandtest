import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/user/reg_requst_model.dart';
import 'package:care_plus_responsesandtest/responses/user/child_by_health_id_responses.dart';
import 'package:http/http.dart' as http;
class ChildbyHealthIDController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(Data data, String token) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user/child-by-health-id';

    Map childbyHealthID = {
      'name': "${data.id}",

    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: childbyHealthID,
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