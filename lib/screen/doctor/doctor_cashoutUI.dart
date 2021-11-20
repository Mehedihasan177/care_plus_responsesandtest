import 'package:care_plus_responsesandtest/controllers/doctor/doctor_cashout_controller.dart';
import 'package:care_plus_responsesandtest/helper/alertDialogue.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorCashoutUI extends StatefulWidget {
  const DoctorCashoutUI({Key? key}) : super(key: key);

  @override
  _DoctorCashoutUIState createState() => _DoctorCashoutUIState();
}

class _DoctorCashoutUIState extends State<DoctorCashoutUI> {
  String amount = "20";
  String finalToken = '';
  Future<void> requestSearchUser(String amount) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    setState(() {
      finalToken = obtainedToken!;
    });
    print(finalToken);
    DoctorCashoutController.requestThenResponsePrint("amount", finalToken).then((
        response) {
      setState(() {
        print(response.statusCode);
        print(response.body);
        if (response.statusCode == 200) {
          // requestSendMoney(usernameC.text,noteC.text);
          // Get.to(SuccessfulCashOut());
          print("Success");
        }else if(response.statusCode == 403){
          AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Already have a pending request');
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
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
                  "Cash out",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  //EasyLoading.show(status: 'loading...');
                  requestSearchUser(amount.toString());

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


      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //
      //     Center(
      //       child: Container(
      //         child: ElevatedButton(
      //           child: Text(
      //             "Doctor Sign In",
      //             style: TextStyle(color: Colors.white, fontSize: 20),
      //           ),
      //           onPressed: () async {
      //             //EasyLoading.show(status: 'loading...');
      //
      //             SharedPreferences sharedPreferences =
      //             await SharedPreferences.getInstance();
      //             DoctorSignInModel myInfo = new DoctorSignInModel(
      //                 mobile: "112345", password: "12345678900");
      //             await DoctorSigninController.requestThenResponsePrint(myInfo)
      //                 .then((value) async {
      //               print(value.statusCode);
      //               print(value.body);
      //               Container(
      //                 height: 1000,
      //                 child: AlertDialogueHelper().showAlertDialog(context, value.body, ''),
      //               );
      //               final Map<String,dynamic> parsed = json.decode(value.body);
      //
      //               final loginobject = User.fromJson(parsed);
      //               print(loginobject.token);
      //               sharedPreferences.setString("token", loginobject.token);
      //               EasyLoading.dismiss();
      //               if (value.statusCode == 200) {
      //
      //                 print("this is the token : " + loginobject.token);
      //                 return  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DoctorUpdateProfileUI(Usertoken: loginobject.token)),);
      //               } else {
      //                 // return LoginController.requestThenResponsePrint(jsonData);
      //                 AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Please recheck email and password');
      //               }
      //
      //             });
      //           },
      //           style: ElevatedButton.styleFrom(
      //             primary: Colors.green,
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(18)),
      //           ),
      //         ),
      //         decoration: BoxDecoration(
      //           //color: Color(0xF60D72),
      //             borderRadius: BorderRadius.circular(18)),
      //       ),
      //     ),
      //
      //   ],
      // ),
    );
  }
}
