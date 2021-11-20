import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/specialization_with_doctor_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/specialization_with_doctor_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorSpecializationWithDoctor extends StatefulWidget {
  const DoctorSpecializationWithDoctor({Key? key}) : super(key: key);

  @override
  _DoctorSpecializationWithDoctorState createState() => _DoctorSpecializationWithDoctorState();
}

class _DoctorSpecializationWithDoctorState extends State<DoctorSpecializationWithDoctor> {
  late String finalToken;

  List<SpecializationWithDoctorResponse> doctorSpecializationWithDoctor = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    SpecializationWithDoctorController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorspecializationWithDoctor = decoded['data'];
        print(decoded['data']);
        doctorSpecializationWithDoctor =
            doctorspecializationWithDoctor.map((model) => SpecializationWithDoctorResponse.fromJson(model)).toList();
        print(doctorSpecializationWithDoctor);

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
    doctorSpecializationWithDoctor = doctorSpecializationWithDoctor.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Doctor Specialization with Doctor",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctorSpecializationWithDoctor.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorSpecializationWithDoctorTile(
                            doctorSpecializationWithDoctor[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorSpecializationWithDoctorTile(SpecializationWithDoctorResponse doctorSpecializationWithDoctor) =>
    SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(doctorSpecializationWithDoctor.name)
          ],
        ),
      ),
    );

