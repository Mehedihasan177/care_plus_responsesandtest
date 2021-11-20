import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/get_type_doctor_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/get_type_doctor_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GetTypeDoctorUI extends StatefulWidget {
  const GetTypeDoctorUI({Key? key}) : super(key: key);

  @override
  _GetTypeDoctorUIState createState() => _GetTypeDoctorUIState();
}

class _GetTypeDoctorUIState extends State<GetTypeDoctorUI> {
  late String finalToken;

  List<GetDoctorTypeResponseElement> getDoctortype = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    GetDoctorsController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable getDoctorType = decoded['data'];
        print(decoded['data']);
        getDoctortype =
            getDoctorType.map((model) => GetDoctorTypeResponseElement.fromJson(model)).toList();
        print(getDoctortype);

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
    getDoctortype = getDoctortype.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Doctor Type",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: getDoctortype.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildgetDoctorTypeTile(
                            getDoctortype[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildgetDoctorTypeTile(GetDoctorTypeResponseElement doctortype)=> SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(doctortype.mobile),
      ],
    ),
  ),
);


