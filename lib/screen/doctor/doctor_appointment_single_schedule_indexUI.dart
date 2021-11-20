import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_single_schedule_index_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_single_schedule_index_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppointmentSingleSchedule extends StatefulWidget {
  const DoctorAppointmentSingleSchedule({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentSingleScheduleState createState() => _DoctorAppointmentSingleScheduleState();
}

class _DoctorAppointmentSingleScheduleState extends State<DoctorAppointmentSingleSchedule> {
  late String finalToken;

  List<DoctorAppointmentSingleScheduleResponses> doctorAppointmentSingleSchedule= [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorAppointmentScheduleSingleController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorSingleAppointmentSchedule = decoded['data'];
        print(decoded['data']);
        doctorAppointmentSingleSchedule =
            doctorSingleAppointmentSchedule.map((model) => DoctorAppointmentSingleScheduleResponses.fromJson(model)).toList();
        print(doctorAppointmentSingleSchedule);

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
    doctorAppointmentSingleSchedule = doctorAppointmentSingleSchedule.reversed.toList();
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
                      itemCount: doctorAppointmentSingleSchedule.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorAppointmentSingleScheduleTile(
                            doctorAppointmentSingleSchedule[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorAppointmentSingleScheduleTile(DoctorAppointmentSingleScheduleResponses doctorAppointmentSingleSchedule) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorAppointmentSingleSchedule.appointmentSlotId.toString()),
      ),
    );
