import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:http/http.dart' as http;
class DoctorCashoutController{

  static Future<http.Response> requestThenResponsePrint(String amount, String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/doctor/cashout';

    Map doctorcashout = {
      'amount': "${amount}",
    };
    var response = await http.post(Uri.parse(url), body: doctorcashout,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}