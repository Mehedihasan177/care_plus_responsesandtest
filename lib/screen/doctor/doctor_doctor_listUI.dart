import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_list_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_list_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorListUI extends StatefulWidget {
  const DoctorListUI({Key? key}) : super(key: key);

  @override
  _DoctorListUIState createState() => _DoctorListUIState();
}

class _DoctorListUIState extends State<DoctorListUI> {
  late String finalToken;

  List<DoctorlistResponse> doctorList = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorListController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorlist = decoded['data'];
        print(decoded['data']);
        doctorList =
            doctorlist.map((model) => DoctorlistResponse.fromJson(model)).toList();
        print(doctorList);

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
    doctorList = doctorList.reversed.toList();
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
                      itemCount: doctorList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorListTile(
                            doctorList[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorListTile(DoctorlistResponse doctorList) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(doctorList.mobile),
      ],
    ),
  ),
);

