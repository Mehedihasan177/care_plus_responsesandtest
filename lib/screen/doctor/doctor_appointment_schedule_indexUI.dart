import 'dart:convert';


import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_schedule_index_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_schedule_index_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppointmentScheduleIndexUI extends StatefulWidget {
  const DoctorAppointmentScheduleIndexUI({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentScheduleIndexUIState createState() => _DoctorAppointmentScheduleIndexUIState();
}

class _DoctorAppointmentScheduleIndexUIState extends State<DoctorAppointmentScheduleIndexUI> {
  late String finalToken;

  List<DoctorAppointmentScheduleIndex> doctorAppointmentIndex = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    AppointmentScheduleIndexController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorIndexAppointment = decoded['data'];
        print(decoded['data']);
        doctorAppointmentIndex =
            doctorIndexAppointment.map((model) => DoctorAppointmentScheduleIndex.fromJson(model)).toList();
        print(doctorAppointmentIndex);

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
    doctorAppointmentIndex = doctorAppointmentIndex.reversed.toList();
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
                      itemCount: doctorAppointmentIndex.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorAppointmentIndexTile(
                            doctorAppointmentIndex[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorAppointmentIndexTile(DoctorAppointmentScheduleIndex doctorAppointmentIndex) =>
    SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(doctorAppointmentIndex.appointmentSlotId.toString()),
          ],
        ),
      ),
    );
