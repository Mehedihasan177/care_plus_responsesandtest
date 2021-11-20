import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/user_wallet_log_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/wallet_log_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletLog extends StatefulWidget {
  const WalletLog({Key? key}) : super(key: key);

  @override
  _WalletLogState createState() => _WalletLogState();
}

class _WalletLogState extends State<WalletLog> {
  late String finalToken;

  List<WalletLogResponses> walletLog = [];


  _getUserWalletLog() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    WalletLogController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable doctorID = decoded['data'];
        print(decoded['data']);
        walletLog =
            doctorID.map((model) => WalletLogResponses.fromJson(model)).toList();
        print(walletLog);

      });
    });
  }

  @override
  void initState() {
    _getUserWalletLog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    walletLog = walletLog.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Wallet Log",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: walletLog.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildWalletLogTile(
                            walletLog[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildWalletLogTile(WalletLogResponses walletLog) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(walletLog.createdAt.toString()),
      ],
    ),
  ),
);

