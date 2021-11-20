import 'package:care_plus_responsesandtest/basic_functions.dart';
import 'package:care_plus_responsesandtest/controllers/doctor/doctor_wallet_recharge_controller.dart';
import 'package:care_plus_responsesandtest/controllers/doctor/dotor_recharge_controller.dart';
import 'package:care_plus_responsesandtest/helper/alertDialogue.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_recharge_model.dart';
import 'package:care_plus_responsesandtest/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorRechargeUI extends StatefulWidget {
  final String Usertoken;
  const DoctorRechargeUI({Key? key, required this.Usertoken}) : super(key: key);

  @override
  _DoctorRechargeUIState createState() => _DoctorRechargeUIState();
}

class _DoctorRechargeUIState extends State<DoctorRechargeUI> {
  final navigatorKey = GlobalKey<NavigatorState>();

  // var bkashTrxc = new TextEditingController();
  // var gatewayc = new TextEditingController();
  String bkashTrxc = "20";
  String gatewayc = "20";
  String finalToken = '';
  // Future<void> requestSearchUser(String amount) async {
  //   final SharedPreferences sharedPreferences =
  //   await SharedPreferences.getInstance();
  //   var obtainedToken = sharedPreferences.getString("token");
  //   setState(() {
  //     finalToken = obtainedToken!;
  //   });
  //   print(finalToken);
  //   DoctorWalletController.requestThenResponsePrint("amount", finalToken).then((
  //       response) {
  //     setState(() {
  //       print(response.statusCode);
  //       print(response.body);
  //       if (response.statusCode == 200) {
  //         // requestSendMoney(usernameC.text,noteC.text);
  //         // Get.to(SuccessfulCashOut());
  //         print("Success");
  //       }else if(response.statusCode == 403){
  //         AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Already have a pending request');
  //       }
  //     });
  //   });
  // }


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
                  "Recharge",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  if (gatewayc.length < 1) {
                    BasicFunctions.showAlertDialogTOView(
                        context,
                        "wrong",
                        "boy"
                        // AppLocalizations.of(context).translate("bankingMethodTitle"),
                        // AppLocalizations.of(context).translate("bankingMethodMessage")
                    );
                  } else if (bkashTrxc.length < 1) {
                    BasicFunctions.showAlertDialogTOView(
                        context,
                        "wrong",
                        "boy"
                    );
                  } else {
                    String toGo = "Gateway: " + gatewayc + " | Trx: " + bkashTrxc; //gatewayc.text, bkashTrxc.text
                    SharedPref sharedPref = new SharedPref();
                    var lg = await sharedPref.read('responsedToken');
                    print("Is this null" + lg);
                    //DoctorRechargeWalletController.requestThenResponsePrint(context, lg, toGo);
                  }
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

//bkashTrxc.text.length