import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/user/create_child_model.dart';
import 'package:care_plus_responsesandtest/models/user/reg_requst_model.dart';
import 'package:http/http.dart' as http;
class CreateChildController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(CreateChildModel createChildModel, String token) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user/child';

    Map data1 = {
      'name': "${createChildModel.name}",
      'mobile': "${createChildModel.mobile}",
      'password': "${createChildModel.password}",
      'gender': "${createChildModel.gender}",
      'address': "${createChildModel.address}",
      'password_confirmation': "${createChildModel.password_confirmation}",
      'image': "${createChildModel.image}",
      'dob': "${createChildModel.dob}",
      'lat': "${createChildModel.lat}",
      'lng': "${createChildModel.lng}",
      'relationship': "${createChildModel.relationship}",
    };

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