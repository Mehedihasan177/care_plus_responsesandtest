import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_slot_disable_responses_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_slot_disable_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppointmentSlotDisableUI extends StatefulWidget {
  const DoctorAppointmentSlotDisableUI({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentSlotDisableUIState createState() => _DoctorAppointmentSlotDisableUIState();
}

class _DoctorAppointmentSlotDisableUIState extends State<DoctorAppointmentSlotDisableUI> {
  late String finalToken;

  List<DoctorAppointmentSlotDisableResponses> doctorAppointmentSlotDisable = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorApponintmentSlotDisableController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listDoctorslotDisable = decoded['data'];
        print(decoded['data']);
        doctorAppointmentSlotDisable =
            listDoctorslotDisable.map((model) => DoctorAppointmentSlotDisableResponses.fromJson(model)).toList();
        print(doctorAppointmentSlotDisable);

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
    doctorAppointmentSlotDisable = doctorAppointmentSlotDisable.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Appointment Slot Disable",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctorAppointmentSlotDisable.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorAppointmentSlotDisableTile(
                            doctorAppointmentSlotDisable[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorAppointmentSlotDisableTile(DoctorAppointmentSlotDisableResponses doctorAppointmentSlotDisable) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorAppointmentSlotDisable.day),
      ),
    );
