import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class BlogsController{
  static Future<http.Response> requestThenResponsePrint(BuildContext context,) async {


    String domain = "https://blogs.medimate.health/api/blogs";

    var url = '$domain/api/blogs';
    print(url);

    // print(token);
    // Here we are getting the response
    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",

        }
    );
    print(response.body);
    return response;
  }
}