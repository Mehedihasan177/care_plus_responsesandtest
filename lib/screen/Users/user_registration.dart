import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/registration_controller.dart';
import 'package:care_plus_responsesandtest/controllers/user/signin_controller.dart';
import 'package:care_plus_responsesandtest/helper/alertDialogue.dart';
import 'package:care_plus_responsesandtest/models/user/reg_requst_model.dart';
import 'package:care_plus_responsesandtest/models/user/signIn_model.dart';
import 'package:care_plus_responsesandtest/responses/user/registration_responses.dart';
import 'package:care_plus_responsesandtest/responses/user/signIn_response.dart';
import 'package:care_plus_responsesandtest/screen/Users/change_password.dart';
import 'package:care_plus_responsesandtest/services/date_time_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRegistrationUI extends StatefulWidget {
  const UserRegistrationUI({Key? key}) : super(key: key);

  @override
  _UserRegistrationUIState createState() => _UserRegistrationUIState();
}

class _UserRegistrationUIState extends State<UserRegistrationUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
            child: ElevatedButton(
              child: Text(
                "Registration",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () async{

                //EasyLoading.show(status: 'loading...');
                RegReqModel myInfo = new RegReqModel(
                    name: "ranam2p",
                    //username: "",
                    email: "mip@gmail.com",
                    password: "12345678900",
                    password_confirmation: "12345678900",
                    address: 'asklj',
                     image: "",
                    mobile: '123412p');
                await RegistrationController.requestThenResponsePrint(myInfo).then((value) async {
                  print(value.statusCode);
                  print(value.body);
                  //EasyLoading.dismiss();
                  if(value.statusCode==200){

                    //EasyLoading.showSuccess('logging in...');
                    SigninModel myInfo = new SigninModel(
                        mobile: "123412p", password: "12345678900");
                    await SigninController.requestThenResponsePrint(myInfo)
                        .then((value) async {
                      print(value.statusCode);
                      print(value.body);
                      final Map parsed = json.decode(value.body);

                      var jsonData = null;
                      SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                      final loginobject = SignInResponse.fromJson(parsed);
                      print(loginobject.data.token);
                      sharedPreferences.setString("token", loginobject.data.token);
                      //EasyLoading.dismiss();
                      if (value.statusCode == 200) {
                        sharedPreferences.setString("mobile", "123412p");
                        sharedPreferences.setString("password", "12345678900");
                        return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ChangePassword(Usertoken: loginobject.data.token)),);
                      } else {
                        // return LoginController.requestThenResponsePrint(jsonData);
                        AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Please recheck email and password');
                      }

                    });

                  }else{
                    AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Already have an account or Please recheck email and password');
                  }
                });

              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF1A150D),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
          ),

    );
  }
}
