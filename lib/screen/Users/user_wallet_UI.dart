import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/user_wallet_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/wallet_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserWallet extends StatefulWidget {
  const UserWallet({Key? key}) : super(key: key);

  @override
  _UserWalletState createState() => _UserWalletState();
}

class _UserWalletState extends State<UserWallet> {
  late String finalToken;

  List<WalletResponse> userWallet = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    UserWalletController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable userWallet = decoded['data'];
        print(decoded['data']);
        userWallet =
            userWallet.map((model) => WalletResponse.fromJson(model)).toList();
        print(userWallet);

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
    userWallet = userWallet.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "User Wallet",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: userWallet.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildUserWalletTile(
                            userWallet[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildUserWalletTile(WalletResponse userWallet) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(userWallet.message),
      ],
    ),
  ),
);
