import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:http/http.dart' as http;
class DoctorWalletController{

  static Future<http.Response> requestThenResponsePrint(String amount, String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/doctor/wallet-recharge';

    Map doctorrecharge = {
      'amount': "${amount}",
    };
    var response = await http.post(Uri.parse(url), body: doctorrecharge,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}