import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/miscellaneous/child_health_id_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class ChildByHealthIdController{

  static Future<http.Response> requestThenResponsePrint(BuildContext context, String token, ChildHealthIDModel childHealthIDModel) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/user/child-by-health-id';

    Map doctorrecharge = {
      'health_id': "${childHealthIDModel.health_id}",
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