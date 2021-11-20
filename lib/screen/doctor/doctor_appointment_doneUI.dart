import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_done_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_done_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppointmentDoneUI extends StatefulWidget {
  const DoctorAppointmentDoneUI({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentDoneUIState createState() => _DoctorAppointmentDoneUIState();
}

class _DoctorAppointmentDoneUIState extends State<DoctorAppointmentDoneUI> {
  late String finalToken;

  List<DoctorAppointmentDoneResponses> doctorAppointmentDone= [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorAppointmentDoneController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorAppointmentOnGoings = decoded['data'];
        print(decoded['data']);
        doctorAppointmentDone =
            doctorAppointmentOnGoings.map((model) => DoctorAppointmentDoneResponses.fromJson(model)).toList();
        print(doctorAppointmentDone);

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
    doctorAppointmentDone = doctorAppointmentDone.reversed.toList();
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
                      itemCount: doctorAppointmentDone.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorAppointmentDoneTile(
                            doctorAppointmentDone[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorAppointmentDoneTile(DoctorAppointmentDoneResponses doctorAppointmentDone) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorAppointmentDone.appointmentSlotId.toString()),
      ),
    );

