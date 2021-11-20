import 'dart:math';
import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class OTPControllers{

  static String apiSMSroot = 'https://esms.mimsms.com/smsapi';
  static String apiEmailroot = 'https://blogs.medimate.health';
  // static String apiSMSrootGET = 'https://esms.mimsms.com/smsapi?api_key=C20080066040da9a0ab5b3.00415555&type=text&contacts=01750726094&senderid=8809612446756&msg=hello';
  static String api_key='C20080066040da9a0ab5b3.00415555';
  static String type='text';
  static String senderID='MediMate';

  static  generateRandom(){
    int min = 100001; //min and max values act as your 6 digit range
    int max = 999999;
    var randomizer = new Random();
    var rNum = min + randomizer.nextInt(max - min);
    if(rNum.toString().length!=6){
      rNum = generateRandom();
    }else{
      return rNum;
    }
  }


  static Future<http.Response> postRequestSendOTP(String phone,String message) async{

    String url = '$apiDomainRoot/api/send-sms/$phone/$message';
    print(url);

    var response = await http.get(Uri.parse(url),
        headers: {"Content-Type": "application/json"});
    print("response.statusCode");
    print(response.statusCode);
    print(response.body);

    return response;
  }



  static Future<http.Response> postRequestSendEmail(String to,String message) async{

    String url = '$apiEmailroot/api/send-mail';


    Map data = {
      'to':"$to",
      'subject':"MediMate Registration",
      'body':"$message"
    };

    print('request');
    print(url);
    print(data.toString());

    var response = await http.post(Uri.parse(url),
        // headers: {"Content-Type": "application/json"},
      body: data
    );

    print('response');
    print(response.statusCode);
    print(response.body);

    return response;
  }




}