import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/doctor_by_id_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/doctor_by_id_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorByIDUI extends StatefulWidget {
  const DoctorByIDUI({Key? key}) : super(key: key);

  @override
  _DoctorByIDUIState createState() => _DoctorByIDUIState();
}

class _DoctorByIDUIState extends State<DoctorByIDUI> {
  late String finalToken;

  List<DoctorbyId> doctorbyID = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorbyIDController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorID = decoded['data'];
        print(decoded['data']);
        doctorbyID =
            doctorID.map((model) => DoctorbyId.fromJson(model)).toList();
        print(doctorbyID);

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
    doctorbyID = doctorbyID.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Doctor by ID",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctorbyID.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorbyIDTile(
                            doctorbyID[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorbyIDTile(DoctorbyId doctorbyID) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(doctorbyID.createdAt.toString()),
      ],
    ),
  ),
);


