import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/miscellaneous/miscellaneous_specialization_controller.dart';
import 'package:care_plus_responsesandtest/responses/miscellaneous/miscellaneous_specialization_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecializationUI extends StatefulWidget {
  const SpecializationUI({Key? key}) : super(key: key);

  @override
  _SpecializationUIState createState() => _SpecializationUIState();
}

class _SpecializationUIState extends State<SpecializationUI> {
  late String finalToken;

  List<MiscellaneousSpecializationResponse> specialization = [];


  _getSpecialization() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    MiscellaneousSpecializationController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listSpecialization = decoded['data'];
        print(decoded['data']);
        specialization =
            listSpecialization.map((model) => MiscellaneousSpecializationResponse.fromJson(model)).toList();
        print(specialization);

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
    specialization = specialization.reversed.toList();
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
                      itemCount: specialization.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildSpecializationTile(
                            specialization[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildSpecializationTile(MiscellaneousSpecializationResponse specialization) =>
    SingleChildScrollView(
      child: Center(
        child: Text(specialization.name),
      ),
    );
