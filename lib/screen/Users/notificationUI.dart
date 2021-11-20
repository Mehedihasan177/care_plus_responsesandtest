import 'dart:convert';
import 'package:care_plus_responsesandtest/controllers/user/notification_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/notification_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NotificationUI extends StatefulWidget {
  const NotificationUI({Key? key}) : super(key: key);

  @override
  _NotificationUIState createState() => _NotificationUIState();
}

class _NotificationUIState extends State<NotificationUI> {
  late String finalToken;

  List<Datum> notification = [];


  _getNotification() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    NotificationController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        notification =
            listNotification.map((model) => Datum.fromJson(model)).toList();
        print(notification);

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
    notification = notification.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Notification",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: notification.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildListTile(
                            notification[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildListTile(Datum notification) => SingleChildScrollView(
  child: Column(
    children: [
      Text(notification.title),
      Text(notification.userId),
      Text(notification.status),
      Text(notification.body),
      Text(notification.createdAt.toString()),
      Text(notification.title),
    ],
  ),
);
