import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/miscellaneous/miscellaneous_specialization_with_doctor_controller.dart';
import 'package:care_plus_responsesandtest/responses/miscellaneous/miscellaneous_specialization_with_doctor_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecializationWithDoctor extends StatefulWidget {
  const SpecializationWithDoctor({Key? key}) : super(key: key);

  @override
  _SpecializationWithDoctorState createState() => _SpecializationWithDoctorState();
}

class _SpecializationWithDoctorState extends State<SpecializationWithDoctor> {
  late String finalToken;

  List<MiscellaneousSpecializationWithDoctorResponse> specializationDoctor = [];


  _getSpecialization() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    MiscellaneousSpecializationWithDoctorController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listSpecialization = decoded['data'];
        print(decoded['data']);
        specializationDoctor =
            listSpecialization.map((model) => MiscellaneousSpecializationWithDoctorResponse.fromJson(model)).toList();
        print(specializationDoctor);

      });
    });
  }

  @override
  void initState() {
    _getSpecialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    specializationDoctor = specializationDoctor.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Specialization",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: specializationDoctor.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildSpecializationWithDoctorTile(
                            specializationDoctor[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildSpecializationWithDoctorTile(MiscellaneousSpecializationWithDoctorResponse specializationDoctor) =>
    SingleChildScrollView(
      child: Center(
        child: Text(specializationDoctor.name),
      ),
    );
