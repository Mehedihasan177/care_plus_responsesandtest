import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_cencel_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_cencel_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DoctorAppointmentCancel extends StatefulWidget {
  const DoctorAppointmentCancel({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentCancelState createState() => _DoctorAppointmentCancelState();
}

class _DoctorAppointmentCancelState extends State<DoctorAppointmentCancel> {
  late String finalToken;

  List<DoctorAppointmentCencel> doctorAppointmentCencel= [];


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
        Iterable AppointmentHistory = decoded['data'];
        print(decoded['data']);
        doctorAppointmentCencel =
            AppointmentHistory.map((model) => DoctorAppointmentCencel.fromJson(model)).toList();
        print(doctorAppointmentCencel);

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
    doctorAppointmentCencel = doctorAppointmentCencel.reversed.toList();
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
                      itemCount: doctorAppointmentCencel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorAppointmentCancelTile(
                            doctorAppointmentCencel[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorAppointmentCancelTile(DoctorAppointmentCencel doctorAppointmentCencel) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorAppointmentCencel.createdAt.toString()),
      ),
    );
