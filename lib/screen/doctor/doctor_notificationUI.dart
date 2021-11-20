import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_notification_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_notification_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorNotificationUI extends StatefulWidget {
  const DoctorNotificationUI({Key? key}) : super(key: key);

  @override
  _DoctorNotificationUIState createState() => _DoctorNotificationUIState();
}

class _DoctorNotificationUIState extends State<DoctorNotificationUI> {
  late String finalToken;

  List<Doctornotification> notification = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorNotificationController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        notification =
            listNotification.map((model) => Doctornotification.fromJson(model)).toList();
        print(notification);

      });
    });
  }

  @override
  void initState() {
    _getNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notification = notification.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Notification",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: notification.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorNotificationTile(
                            notification[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorNotificationTile(Doctornotification notification) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(notification.title),
      ],
    ),
  ),
);

