import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_slot_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_slot_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppointmentSlotUI extends StatefulWidget {
  const DoctorAppointmentSlotUI({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentSlotUIState createState() => _DoctorAppointmentSlotUIState();
}

class _DoctorAppointmentSlotUIState extends State<DoctorAppointmentSlotUI> {
  late String finalToken;

  List<DoctorAppointmentSlotResponses> doctorAppointment = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorAppointmentSlotController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listDoctorslot = decoded['data'];
        print(decoded['data']);
        doctorAppointment =
            listDoctorslot.map((model) => DoctorAppointmentSlotResponses.fromJson(model)).toList();
        print(doctorAppointment);

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
    doctorAppointment = doctorAppointment.reversed.toList();
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
                      itemCount: doctorAppointment.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorAppointmentSlotTile(
                            doctorAppointment[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorAppointmentSlotTile(DoctorAppointmentSlotResponses doctorAppointment) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorAppointment.endTime),
      ),
    );

