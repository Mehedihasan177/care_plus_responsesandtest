import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/notification_delete_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/notification_delete_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationDeleteUI extends StatefulWidget {
  const NotificationDeleteUI({Key? key}) : super(key: key);

  @override
  _NotificationDeleteUIState createState() => _NotificationDeleteUIState();
}

class _NotificationDeleteUIState extends State<NotificationDeleteUI> {
  late String finalToken;

  List<NotificationDeleteResponse> notificationDeleteList = [];


  _getNotificationDelete() async {
    SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    NotificationDeleteController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        // Map<String, dynamic> decoded = json.decode("${value.body}");
        // Iterable notificationDelete = decoded['data'];
        // print(decoded['data']);
        // notificationDeleteList =
        //     notificationDelete.map((model) => NotificationDeleteResponse.fromJson(model)).toList();
        // print(notificationDeleteList);

      });
    });
  }

  @override
  void initState() {
    _getNotificationDelete();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notificationDeleteList = notificationDeleteList.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Notification Delete",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: notificationDeleteList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildNotificationDeletetTile(
                            notificationDeleteList[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildNotificationDeletetTile(NotificationDeleteResponse notificationDeleteList) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(notificationDeleteList.data)
      ],
    ),
  ),
);

