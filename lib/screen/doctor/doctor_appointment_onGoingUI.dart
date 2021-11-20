import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_onGoing_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_onGoing_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppointmentOnGoingUI extends StatefulWidget {
  const DoctorAppointmentOnGoingUI({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentOnGoingUIState createState() => _DoctorAppointmentOnGoingUIState();
}

class _DoctorAppointmentOnGoingUIState extends State<DoctorAppointmentOnGoingUI> {
  late String finalToken;

  List<DoctorAppointmentOnGoingResponse> doctorAppointmentOnGoing= [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorAppointmentOnGoingController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorAppointmentOnGoings = decoded['data'];
        print(decoded['data']);
        doctorAppointmentOnGoing =
            doctorAppointmentOnGoings.map((model) => DoctorAppointmentOnGoingResponse.fromJson(model)).toList();
        print(doctorAppointmentOnGoing);

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
    doctorAppointmentOnGoing = doctorAppointmentOnGoing.reversed.toList();
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
                      itemCount: doctorAppointmentOnGoing.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorAppointmentOnGoingsTile(
                            doctorAppointmentOnGoing[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorAppointmentOnGoingsTile(DoctorAppointmentOnGoingResponse doctorAppointmentOnGoing) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorAppointmentOnGoing.message),
      ),
    );

