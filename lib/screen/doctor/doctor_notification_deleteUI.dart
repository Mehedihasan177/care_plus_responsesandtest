import 'package:care_plus_responsesandtest/controllers/doctor/doctor_notification_delete_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_notification_delete_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorNotificationDelete extends StatefulWidget {
  const DoctorNotificationDelete({Key? key}) : super(key: key);

  @override
  _DoctorNotificationDeleteState createState() => _DoctorNotificationDeleteState();
}

class _DoctorNotificationDeleteState extends State<DoctorNotificationDelete> {
  late String finalToken;

  List<DoctorNotificationDeleteResponse> doctornotificationDeleteList = [];


  _getNotificationDelete() async {
    SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorNotificationDeleteController.requestThenResponsePrint(finalToken).then((value) {
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
    doctornotificationDeleteList = doctornotificationDeleteList.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Doctor Notification Delete",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctornotificationDeleteList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorNotificationDeletetTile(
                            doctornotificationDeleteList[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildDoctorNotificationDeletetTile(DoctorNotificationDeleteResponse doctornotificationDeleteList) =>
    SingleChildScrollView(
      child: Text(doctornotificationDeleteList.data),
    );


