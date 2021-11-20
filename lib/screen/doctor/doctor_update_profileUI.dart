// import 'dart:convert';
//
// import 'package:care_plus_responsesandtest/controllers/doctor/doctor_update_profile_contoller.dart';
// import 'package:care_plus_responsesandtest/helper/alertDialogue.dart';
// import 'package:care_plus_responsesandtest/models/doctor/doctor_update_profile_model.dart';
// import 'package:care_plus_responsesandtest/responses/doctor/doctor_update_profile_responses.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class DoctorUpdateProfileUI extends StatefulWidget {
//   final String Usertoken;
//   const DoctorUpdateProfileUI({Key? key, required this.Usertoken}) : super(key: key);
//
//   @override
//   _DoctorUpdateProfileUIState createState() => _DoctorUpdateProfileUIState();
// }
//
// class _DoctorUpdateProfileUIState extends State<DoctorUpdateProfileUI> {
//   TextEditingController _textMobile = TextEditingController();
//   TextEditingController _textPassword = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       backgroundColor: Colors.white70.withOpacity(0.9),
//       body:
//
//
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               child:
//
//               ElevatedButton(
//                 child: Text(
//                   "change password",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 onPressed: () {
//                   print("token of user\n");
//                   var Usertoken;
//                   print("token at call mehedi hasan who are you: " +
//                       Usertoken);
//                   // DoctorProfileUpdateModel doctorUpdateProfile = DoctorProfileUpdateModel(
//                   //     visit_charge: '2',
//                   //     name: 'x',
//                   //     nid: '1',
//                   //     image: '',
//                   //     specializations2: '1',
//                   //     specializations1: 'x'
//                   //
//                   // );
//                   DoctorProfileUpdateModel myInfo = new DoctorProfileUpdateModel(
//                       visit_charge: '2',
//                       name: 'x',
//                       nid: '1',
//                       image: '',
//                       specializations2: '1',
//                       specializations1: 'x'
//                   );
//                   DoctorUpdateProfileController.requestThenResponsePrint(
//                       context, widget.Usertoken, myInfo)
//                       .then((value) {
//                     print(value.statusCode);
//                     if (value.statusCode == 200) {
//                       print("successfully done");
//                       // if (yOn == 0) {
//                       //   navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => ChangePasswordSuccessPage()));
//                       // } else {
//                       //   SigninController.requestThenResponsePrint(context, widget.userType, widget.userPhone, newPassC.text);
//                       // }
//                     } else {
//                       // BasicFunctions.showAlertDialogTOView(context,
//                       //     AppLocalizations.of(context).translate("passwordRecheckTitle"),
//                       //     AppLocalizations.of(context).translate("passwordRecheckMessage"));
//                       // BasicFunctions.showAlertDialogTOView(context, "Warning", "Please recheck your passwords to change");
//                     }
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xFF1A150D),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18)),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                   //color: Color(0xF60D72),
//                   borderRadius: BorderRadius.circular(18)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
