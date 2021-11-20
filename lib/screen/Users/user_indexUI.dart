import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/user_index_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/user_index_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserIndexUI extends StatefulWidget {
  const UserIndexUI({Key? key}) : super(key: key);

  @override
  _UserIndexUIState createState() => _UserIndexUIState();
}

class _UserIndexUIState extends State<UserIndexUI> {
  late String finalToken;

  List<UserIndex> userIndex = [];


  _getUserIndex() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(" this is the final token" + finalToken);

    UserIndexController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listUserIndex = decoded['data'];
        print(decoded['data']);
        userIndex =
            listUserIndex.map((model) => UserIndex.fromJson(model)).toList();
        print(userIndex);

      });
    });
  }

  @override
  void initState() {
    _getUserIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userIndex = userIndex.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: userIndex.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildUserIndexTile(
                            userIndex[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildUserIndexTile(UserIndex userIndex) => SingleChildScrollView(
  child: Column(
    children: [
      Text("this is hot"),
      Text(userIndex.date.toString()),
      Text(userIndex.createdAt.toString()),
    ],
  ),
);


