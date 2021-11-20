import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/apponitment_cencel_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/appointment_cencel_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentCencelUI extends StatefulWidget {
  const AppointmentCencelUI({Key? key}) : super(key: key);

  @override
  _AppointmentCencelUIState createState() => _AppointmentCencelUIState();
}

class _AppointmentCencelUIState extends State<AppointmentCencelUI> {
  late String finalToken;

  List<AppintmentCanel> appointmentCencel = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    AppointmentCencelController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable appointmentcencel = decoded['data'];
        print(decoded['data']);
        appointmentCencel =
            appointmentcencel.map((model) => AppintmentCanel.fromJson(model)).toList();
        print(appointmentCencel);

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
    appointmentCencel = appointmentCencel.reversed.toList();
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
                      itemCount: appointmentCencel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildAppointmentCencelTile(
                            appointmentCencel[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}


Widget buildAppointmentCencelTile(AppintmentCanel appointmentCencel) => SingleChildScrollView(
  child: Column(
    children: [
      Text(appointmentCencel.createdAt.toString()),
    ],
  ),
);
