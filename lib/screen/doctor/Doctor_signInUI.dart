import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_signIn_controller.dart';
import 'package:care_plus_responsesandtest/helper/alertDialogue.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_sinIn_model.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_login_responses.dart';
import 'package:care_plus_responsesandtest/screen/doctor/create_e_prescriptionUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_E_prescription_showUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_cencelUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_createUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_doneUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_historyUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_indexUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_onGoingUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_schedule_indexUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_single_schedule_indexUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_slotUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_slot_deleteUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_appointment_slot_disableUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_cashoutUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_change_password.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_delete_E_prescriptionUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_doctor_listUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_index_E_prescriptionUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_notificationUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_notification_deleteUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_rechargeUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_specializationUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_specialization_with_doctorUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_update_profileUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_walletUI.dart';
import 'package:care_plus_responsesandtest/screen/doctor/doctor_wallet_logUI.dart';
import 'package:care_plus_responsesandtest/screen/miscellaneous/blogsUI.dart';
import 'package:care_plus_responsesandtest/screen/miscellaneous/health_idUI.dart';
import 'package:care_plus_responsesandtest/screen/miscellaneous/specializationUI.dart';
import 'package:care_plus_responsesandtest/screen/miscellaneous/specialization_with_doctorUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorSignIn extends StatefulWidget {
  const DoctorSignIn({Key? key}) : super(key: key);

  @override
  _DoctorSignInState createState() => _DoctorSignInState();
}

class _DoctorSignInState extends State<DoctorSignIn> {

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
                  DoctorSignInModel myInfo = new DoctorSignInModel(
                      mobile: "112345", password: "123456789");
                  await DoctorSigninController.requestThenResponsePrint(myInfo)
                      .then((value) async {
                    print(value.statusCode);
                    print(value.body);
                    Container(
                      height: 1000,
                      child: AlertDialogueHelper().showAlertDialog(context, value.body, ''),
                    );
                    final Map<String,dynamic> parsed = json.decode(value.body);

                    final loginobject = DoctorLoginResponse.fromJson(parsed);
                    print(loginobject.data.token);
                    sharedPreferences.setString("token", loginobject.data.token);
                    EasyLoading.dismiss();
                    if (value.statusCode == 200) {

                      print(loginobject.data.token);
                      //return  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HealthIDUI(Usertoken: loginobject.data.token,)),);
                      //return  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DoctorAppointmentCreateUI(Usertoken: loginobject.data.token,)),);
                      return  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SpecializationWithDoctor()),);
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
