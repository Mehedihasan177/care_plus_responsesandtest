import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_registration_controller.dart';
import 'package:care_plus_responsesandtest/controllers/doctor/doctor_signIn_controller.dart';
import 'package:care_plus_responsesandtest/helper/alertDialogue.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_registration_model.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_sinIn_model.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_login_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorRegistrationUI extends StatefulWidget {
  const DoctorRegistrationUI({Key? key}) : super(key: key);

  @override
  _DoctorRegistrationUIState createState() => _DoctorRegistrationUIState();
}

class _DoctorRegistrationUIState extends State<DoctorRegistrationUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: ElevatedButton(
          child: Text(
            "Doctor Registration",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async{

            //EasyLoading.show(status: 'loading...');
            DoctorRegReqModel myInfo = new DoctorRegReqModel(
                name: "mehedi",
                //username: "",
                email: "emailekai@gmail.com",
                password: "12345678900",
                password_confirmation: "12345678900",
                image: "assets/download.jpg",
                mobile: '112345',
                bmdc_reg: '123456',
                referral_code: '');
            await DoctorRegistrationController.requestThenResponsePrint(myInfo).then((value) async {
              print(value.statusCode);
              print(value.body);
              //EasyLoading.dismiss();
              if(value.statusCode==200){

                //EasyLoading.showSuccess('logging in...');
                DoctorSignInModel myInfo = new DoctorSignInModel(
                    mobile: "112345", password: "12345678900");
                await DoctorSigninController.requestThenResponsePrint(myInfo)
                    .then((value) async {
                  print(value.statusCode);
                  print(value.body);
                  Container(
                    height: 1000,
                    child: AlertDialogueHelper().showAlertDialog(context, value.body, ''),
                  );
                  final Map parsed = json.decode(value.body);

                  var jsonData = null;
                  SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
                  final loginobject = User.fromJson(parsed);
                  print(loginobject.token);
                  sharedPreferences.setString("token", loginobject.token);
                  //EasyLoading.dismiss();
                  if (value.statusCode == 200) {
                    sharedPreferences.setString("mobile", "112345");
                    sharedPreferences.setString("password", "12345678900");
                    //return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ChangePassword(Usertoken: loginobject.data.token)),);
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
