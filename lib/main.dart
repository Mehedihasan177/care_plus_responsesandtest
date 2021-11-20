import 'package:care_plus_responsesandtest/screen/Users/signin.dart';
import 'package:care_plus_responsesandtest/screen/doctor/Doctor_signInUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_registrationUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: DoctorSignIn(),
      builder: EasyLoading.init(),
    );
  }
}
