import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_index_E_prescription.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_index_E_Prescription_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorIndexEPrescriptionUI extends StatefulWidget {
  const DoctorIndexEPrescriptionUI({Key? key}) : super(key: key);

  @override
  _DoctorIndexEPrescriptionUIState createState() => _DoctorIndexEPrescriptionUIState();
}

class _DoctorIndexEPrescriptionUIState extends State<DoctorIndexEPrescriptionUI> {
  late String finalToken;

  List<DoctorEprescriptionIndexResponseElement> eprescriptionIndex = [];


  _getEPrescriptionIndex() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorIndexEPrescriptionController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        eprescriptionIndex =
            listNotification.map((model) => DoctorEprescriptionIndexResponseElement.fromJson(model)).toList();
        print(eprescriptionIndex);

      });
    });
  }

  @override
  void initState() {
    _getEPrescriptionIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    eprescriptionIndex = eprescriptionIndex.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "E prescription List",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: eprescriptionIndex.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorIndexEPrescriptionTile(
                            eprescriptionIndex[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorIndexEPrescriptionTile(DoctorEprescriptionIndexResponseElement eprescriptionIndex) =>
    SingleChildScrollView(
      child: Center(
        child: Text("Doctor ID: " + eprescriptionIndex.doctorId),
      ),
    );
