import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/doctor/doctor_wallet_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_wallet_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorWalletUI extends StatefulWidget {
  const DoctorWalletUI({Key? key}) : super(key: key);

  @override
  _DoctorWalletUIState createState() => _DoctorWalletUIState();
}

class _DoctorWalletUIState extends State<DoctorWalletUI> {
  late String finalToken;

  List<DoctorWalletResponse> doctorwallet = [];


  _getUserWallet() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorWalletController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listDoctorWallet = decoded['data'];
        print(decoded['data']);
        doctorwallet =
            listDoctorWallet.map((model) => DoctorWalletResponse.fromJson(model)).toList();
        print(doctorwallet);

      });
    });
  }

  @override
  void initState() {
    _getUserWallet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    doctorwallet = doctorwallet.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Wallet",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctorwallet.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorwalletListTile(
                            doctorwallet[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorwalletListTile(DoctorWalletResponse doctorwallet) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorwallet.data),
      ),
    );
