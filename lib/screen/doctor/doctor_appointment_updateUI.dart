// import 'dart:convert';
//
// import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_update_controller.dart';
// import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_update_responses.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class DoctorAppointmentUpdateUI extends StatefulWidget {
//   const DoctorAppointmentUpdateUI({Key? key}) : super(key: key);
//
//   @override
//   _DoctorAppointmentUpdateUIState createState() => _DoctorAppointmentUpdateUIState();
// }
//
// class _DoctorAppointmentUpdateUIState extends State<DoctorAppointmentUpdateUI> {
//   late String finalToken;
//
//   List<DoctorAppointmentUpdateResponses> notification = [];
//
//
//   _getNotification() async {
//     final SharedPreferences sharedPreferences = await SharedPreferences
//         .getInstance();
//     var catchtoken = sharedPreferences.getString("token");
//     setState(() {
//       finalToken = catchtoken!;
//     });
//     print(finalToken);
//
//     DoctorAppointmentUpdateController.requestThenResponsePrint(finalToken, data).then((value) {
//       setState(() {
//         print(value.body);
//         Map<String, dynamic> decoded = json.decode("${value.body}");
//         Iterable listNotification = decoded['data'];
//         print(decoded['data']);
//         notification =
//             listNotification.map((model) => DoctorAppointmentUpdateResponses.fromJson(model)).toList();
//         print(notification);
//
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     _getNotification();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     notification = notification.reversed.toList();
//     return Scaffold(
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                   "Notification",
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//
//
//               Expanded(
//                   child: ListView.builder(
//                       itemCount: notification.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return buildDoctorNotificationTile(
//                             notification[index]);
//                       }
//                   )
//               ),
//             ],
//           ),
//         )
//     );
//   }
// }
