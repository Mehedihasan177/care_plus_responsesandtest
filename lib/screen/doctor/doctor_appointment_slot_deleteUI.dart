import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_slot_delete_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_appointment_slot_delete_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorAppointmentSlotDeleteUI extends StatefulWidget {
  const DoctorAppointmentSlotDeleteUI({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentSlotDeleteUIState createState() => _DoctorAppointmentSlotDeleteUIState();
}

class _DoctorAppointmentSlotDeleteUIState extends State<DoctorAppointmentSlotDeleteUI> {
  late String finalToken;

  List<DoctorAppointmentSlotDeleteeResponse> doctorAppointmentDelete = [];


  _getDoctorAppointmentSlotDelete() async {
    SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DoctorAppointmentSlotDeleteController.requestThenResponsePrint(finalToken).then((value) {
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
    _getDoctorAppointmentSlotDelete();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    doctorAppointmentDelete = doctorAppointmentDelete.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Appointment slot Delete",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctorAppointmentDelete.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildAppointmentSlotDeletetTile(
                            doctorAppointmentDelete[index]);
                      }
                  )
              ),
            ],
          ),
        )
    );
  }
}

Widget buildAppointmentSlotDeletetTile(DoctorAppointmentSlotDeleteeResponse doctorAppointmentDelete) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorAppointmentDelete.message),
      ),
    );
