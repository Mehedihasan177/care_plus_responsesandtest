import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_list_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/doctor_list_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorListUI extends StatefulWidget {
  const DoctorListUI({Key? key}) : super(key: key);

  @override
  _DoctorListUIState createState() => _DoctorListUIState();
}

class _DoctorListUIState extends State<DoctorListUI> {
  late String finalToken;

  List<DoctorList> doctorlist = [];


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
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        doctorlist =
            listNotification.map((model) => DoctorList.fromJson(model)).toList();
        print(doctorlist);

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
    doctorlist = doctorlist.reversed.toList();
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
                      itemCount: doctorlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorListTile(
                            doctorlist[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorListTile(DoctorList doctorlist) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(doctorlist.mobile),
      ],
    ),
  )


);

