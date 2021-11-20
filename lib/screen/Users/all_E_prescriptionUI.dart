import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/all_e_prescription_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/all_e_prescription_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllEPrescriptionUI extends StatefulWidget {
  const AllEPrescriptionUI({Key? key}) : super(key: key);

  @override
  _AllEPrescriptionUIState createState() => _AllEPrescriptionUIState();
}

class _AllEPrescriptionUIState extends State<AllEPrescriptionUI> {
  late String finalToken;

  List<AllEPrescription> eprescription = [];


  _getAllEPrescription() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    AllEPrescriptionController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorID = decoded['data'];
        print(decoded['data']);
        eprescription =
            doctorID.map((model) => AllEPrescription.fromJson(model)).toList();
        print(eprescription);

      });
    });
  }

  @override
  void initState() {
    _getAllEPrescription();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    eprescription = eprescription.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Eprescription",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: eprescription.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildEPrescriptionTile(
                            eprescription[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildEPrescriptionTile(AllEPrescription eprescription) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(eprescription.createdAt.toString()),
      ],
    ),
  ),
);