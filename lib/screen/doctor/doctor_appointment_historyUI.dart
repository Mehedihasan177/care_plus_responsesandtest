import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_history_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_history_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DoctorAppointmentHistoryUI extends StatefulWidget {
  const DoctorAppointmentHistoryUI({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentHistoryUIState createState() => _DoctorAppointmentHistoryUIState();
}

class _DoctorAppointmentHistoryUIState extends State<DoctorAppointmentHistoryUI> {
  late String finalToken;

  List<DoctorAppointmentHistoryResponseElement> doctorAppointmentHistory= [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorAppointmentHistoryController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable AppointmentHistory = decoded['data'];
        print(decoded['data']);
        doctorAppointmentHistory =
            AppointmentHistory.map((model) => DoctorAppointmentHistoryResponseElement.fromJson(model)).toList();
        print(doctorAppointmentHistory);

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
    doctorAppointmentHistory = doctorAppointmentHistory.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Doctor List",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctorAppointmentHistory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorAppointmentHistoryTile(
                            doctorAppointmentHistory[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorAppointmentHistoryTile(DoctorAppointmentHistoryResponseElement doctorAppointmentHistory) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorAppointmentHistory.createdAt.toString()),
      ),
    );

