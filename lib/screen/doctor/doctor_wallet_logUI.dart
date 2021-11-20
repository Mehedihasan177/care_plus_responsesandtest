import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_wallet_log_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_wallet_log_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorWalletLogUI extends StatefulWidget {
  const DoctorWalletLogUI({Key? key}) : super(key: key);

  @override
  _DoctorWalletLogUIState createState() => _DoctorWalletLogUIState();
}

class _DoctorWalletLogUIState extends State<DoctorWalletLogUI> {
  late String finalToken;

  List<DoctorWalletLogResponseElement> doctorWalletLog = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorWalletLogController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorwalletLog = decoded['data'];
        print(decoded['data']);
        doctorWalletLog =
            doctorwalletLog.map((model) => DoctorWalletLogResponseElement.fromJson(model)).toList();
        print(doctorWalletLog);

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
    doctorWalletLog = doctorWalletLog.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Doctor Specialization",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctorWalletLog.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorWalletLogTile(
                            doctorWalletLog[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorWalletLogTile(DoctorWalletLogResponseElement doctorWalletLog) =>
    SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(doctorWalletLog.amount.toString()),
          ],
        ),
      ),
    );
