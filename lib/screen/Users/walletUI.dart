import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/user_wallet_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/wallet_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletUI extends StatefulWidget {
  const WalletUI({Key? key}) : super(key: key);

  @override
  _WalletUIState createState() => _WalletUIState();
}

class _WalletUIState extends State<WalletUI> {
  late String finalToken;

  List<WalletResponse> wallet = [];


  _getUserWallet() async {
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
        Iterable listWallet = decoded['data'];
        print(decoded['data']);
        wallet =
            listWallet.map((model) => WalletResponse.fromJson(model)).toList();
        print(wallet);

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
    wallet = wallet.reversed.toList();
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
                      itemCount: wallet.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildwalletListTile(
                            wallet[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildwalletListTile(WalletResponse wallet) => SingleChildScrollView(
  child: Column(
    children: [
      Text(wallet.data),
      Text(wallet.message),
    ],
  ),
);



