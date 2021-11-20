import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_specialization_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_specialization_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorSpecializationUI extends StatefulWidget {
  const DoctorSpecializationUI({Key? key}) : super(key: key);

  @override
  _DoctorSpecializationUIState createState() => _DoctorSpecializationUIState();
}

class _DoctorSpecializationUIState extends State<DoctorSpecializationUI> {
  late String finalToken;

  List<DoctorSpecializationResponse> doctorSpecialisation = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorSpecializationController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorSpecialization = decoded['data'];
        print(decoded['data']);
        doctorSpecialisation =
            doctorSpecialization.map((model) => DoctorSpecializationResponse.fromJson(model)).toList();
        print(doctorSpecialisation);

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
    doctorSpecialisation = doctorSpecialisation.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Doctor Specialization",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctorSpecialisation.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorSpecializationTile(
                            doctorSpecialisation[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorSpecializationTile(DoctorSpecializationResponse doctorSpecialisation) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(doctorSpecialisation.name),
      ],
    ),
  ),
);

