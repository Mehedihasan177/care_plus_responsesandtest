import 'dart:convert';
import 'package:care_plus_responsesandtest/controllers/user/notification_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/profle_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileUI extends StatefulWidget {
  const ProfileUI({Key? key}) : super(key: key);

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  late String finalToken;

  List<Profile> profile = [];


  _getUserProfile() async {
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
        Iterable listProfile = decoded['data'];
        print(decoded['data']);
        profile =
            listProfile.map((model) => Profile.fromJson(model)).toList();
        print(profile);

      });
    });
  }

  @override
  void initState() {
    _getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    profile = profile.reversed.toList();
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
                      itemCount: profile.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildListTile(
                            profile[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildListTile(Profile profile) => SingleChildScrollView(
  child: Column(
    children: [
      Text(profile.mobile),
      Text(profile.email),
      Text(profile.address),
      Text(profile.createdAt.toString()),
      Text(profile.createdAt.toString()),
      Text(profile.emailVerifiedAt),
    ],
  ),
);


