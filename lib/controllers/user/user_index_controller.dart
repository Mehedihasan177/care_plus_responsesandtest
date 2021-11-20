import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:http/http.dart' as http;
class UserIndexController{

  static Future<http.Response> requestThenResponsePrint(String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/user/appointment-schedule';

    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}