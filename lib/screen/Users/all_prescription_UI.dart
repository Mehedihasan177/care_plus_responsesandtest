import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/all_prescription_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/all_prescription_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllPrescriptionUI extends StatefulWidget {
  const AllPrescriptionUI({Key? key}) : super(key: key);

  @override
  _AllPrescriptionUIState createState() => _AllPrescriptionUIState();
}

class _AllPrescriptionUIState extends State<AllPrescriptionUI> {
  late String finalToken;

  List<Epre> allPrescription = [];


  _getAllPrescription() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    AllPrescriptionController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable allprescription = decoded['data'];
        print(decoded['data']);
        allPrescription =
            allprescription.map((model) => Epre.fromJson(model)).toList();
        print(allPrescription);

      });
    });
  }

  @override
  void initState() {
    _getAllPrescription();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    allPrescription = allPrescription.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "All Prescription",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: allPrescription.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildAllPrescriptionTile(
                            allPrescription[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildAllPrescriptionTile(Epre allPrescription) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(allPrescription.createdAt.toString()),
      ],
    ),
  ),
);

