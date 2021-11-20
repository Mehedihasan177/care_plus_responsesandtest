import 'dart:convert';

import 'package:care_plus_responsesandtest/controllers/user/doctor_with_time_slot_controller.dart';
import 'package:care_plus_responsesandtest/responses/user/doctor_with_time_slot_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllDoctorSlot extends StatefulWidget {
  const AllDoctorSlot({Key? key}) : super(key: key);

  @override
  _AllDoctorSlotState createState() => _AllDoctorSlotState();
}

class _AllDoctorSlotState extends State<AllDoctorSlot> {
  late String finalToken;

  List<DoctorWithTimeSlotResponse> allDoctorSlot = [];


  _getAllDoctorSlot() async {
     SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

     DoctorWithTimeSlotController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable alldoctorSlot = decoded['data'];
        print(decoded['data']);
        allDoctorSlot =
            alldoctorSlot.map((model) => DoctorWithTimeSlotResponse.fromJson(model)).toList();
        print(allDoctorSlot);

      });
    });
  }

  @override
  void initState() {
    _getAllDoctorSlot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    allDoctorSlot = allDoctorSlot.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Doctor with Time Slot",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: allDoctorSlot.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildAllDoctorSlotTile(
                            allDoctorSlot[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildAllDoctorSlotTile(DoctorWithTimeSlotResponse allDoctorSlot) => SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        Text(allDoctorSlot.createdAt.toString()),
      ],
    ),
  ),
);

// Widget buildAllDoctorSlotTile(AllDoctorSlotResponse allDoctorSlot) => SingleChildScrollView(
//   child: Center(
//     child: Column(
//       children: [
//         Text(allDoctorSlot.createdAt.toString()),
//       ],
//     ),
//   ),
// );
