import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/signin_controller.dart';
import 'package:care_plus_responsesandtest/helper/alertDialogue.dart';
import 'package:care_plus_responsesandtest/models/user/signIn_model.dart';
import 'package:care_plus_responsesandtest/responses/user/signIn_response.dart';
import 'package:care_plus_responsesandtest/screen/Users/all_E_prescriptionUI.dart';
import 'package:care_plus_responsesandtest/screen/Users/all_prescription_UI.dart';
import 'package:care_plus_responsesandtest/screen/Users/change_password.dart';
import 'package:care_plus_responsesandtest/screen/Users/doctor_by_idui.dart';
import 'package:care_plus_responsesandtest/screen/Users/notificationUI.dart';
import 'package:care_plus_responsesandtest/screen/Users/notification_delete_UI.dart';
import 'package:care_plus_responsesandtest/screen/Users/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _textMobile = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: Container(
              child: ElevatedButton(
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  //EasyLoading.show(status: 'loading...');

                  SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
                  SigninModel myInfo = new SigninModel(
                      mobile: "123", password: "1234567890");
                  await SigninController.requestThenResponsePrint(myInfo)
                      .then((value) async {
                    print(value.statusCode);
                    print(value.body);
                    Container(
                      height: 1000,
                      child: AlertDialogueHelper().showAlertDialog(context, value.body, ''),
                    );
                    final Map<String,dynamic> parsed = json.decode(value.body);

                    final loginobject = SignInResponse.fromJson(parsed);
                    print(loginobject.data.token);
                    sharedPreferences.setString("token", loginobject.data.token);
                    EasyLoading.dismiss();
                    if (value.statusCode == 200) {
                      sharedPreferences.setString("email", _textMobile.text);
                      sharedPreferences.setString("password", _textPassword.text);
                     return  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ChangePassword(Usertoken: loginobject.data.token,)),);
                    } else {
                      // return LoginController.requestThenResponsePrint(jsonData);
                      AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Please recheck email and password');
                    }

                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xfff9A825),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              decoration: BoxDecoration(
                //color: Color(0xF60D72),
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),

        ],
      ),
    );
  }
}

