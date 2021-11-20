import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_E_prescription_show_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_E_prescription_show_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorEPrescrptionShowUI extends StatefulWidget {
  const DoctorEPrescrptionShowUI({Key? key}) : super(key: key);

  @override
  _DoctorEPrescrptionShowUIState createState() => _DoctorEPrescrptionShowUIState();
}

class _DoctorEPrescrptionShowUIState extends State<DoctorEPrescrptionShowUI> {
  late String finalToken;

  List<DoctorEPrescriptionShow> eprescriptionShow = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    EPrescriptionShowController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listeprescriptionShow = decoded['data'];
        print(decoded['data']);
        eprescriptionShow =
            listeprescriptionShow.map((model) => DoctorEPrescriptionShow.fromJson(model)).toList();
        print(eprescriptionShow);

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
    eprescriptionShow = eprescriptionShow.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "E prescription Show",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: eprescriptionShow.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorEPrescriptionShowTile(
                            eprescriptionShow[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorEPrescriptionShowTile(DoctorEPrescriptionShow eprescriptionShow) =>
    SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(eprescriptionShow.doctorId.toString()),
          ],
        ),
      ),
    );

