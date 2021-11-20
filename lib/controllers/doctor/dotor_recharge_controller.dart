import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class DoctorRechargeWalletController{

  static Future<http.Response> requestThenResponsePrint(BuildContext context,String amount, String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/doctor/wallet-recharge';

    Map userrecharge = {
      'amount': "${amount}",
    };
    var response = await http.post(Uri.parse(url), body: userrecharge,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}