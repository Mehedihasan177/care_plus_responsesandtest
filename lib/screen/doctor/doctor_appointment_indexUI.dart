import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_index_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_index_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppointmentIndexUI extends StatefulWidget {
  const DoctorAppointmentIndexUI({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentIndexUIState createState() => _DoctorAppointmentIndexUIState();
}

class _DoctorAppointmentIndexUIState extends State<DoctorAppointmentIndexUI> {
  late String finalToken;

  List<DoctorIndexResponseElement> doctorIndex = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorAppointmentIndexController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        doctorIndex =
            listNotification.map((model) => DoctorIndexResponseElement.fromJson(model)).toList();
        print(doctorIndex);

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
    doctorIndex = doctorIndex.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Doctor Appointment Index",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctorIndex.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorAppointmentIndexTile(
                            doctorIndex[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorAppointmentIndexTile(DoctorIndexResponseElement doctorIndex) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorIndex.day),
      ),
    );