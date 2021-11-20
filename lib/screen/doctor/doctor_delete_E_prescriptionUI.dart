import 'package:care_plus_responsesandtest/controllers/doctor/doctor_delete_E_prescription_controller.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_delete_E_prescription_responses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorDeleteEPrescriptionUI extends StatefulWidget {
  const DoctorDeleteEPrescriptionUI({Key? key}) : super(key: key);

  @override
  _DoctorDeleteEPrescriptionUIState createState() => _DoctorDeleteEPrescriptionUIState();
}

class _DoctorDeleteEPrescriptionUIState extends State<DoctorDeleteEPrescriptionUI> {
  late String finalToken;

  List<DoctorDeleteEPrescriptionResponse> doctorAppointmentDelete = [];


  _getNotificationDelete() async {
    SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var catchtoken = sharedPreferences.getString("token");
    setState(() {
      finalToken = catchtoken!;
    });
    print(finalToken);

    DeleteEPrescriptionController.requestThenResponsePrint(finalToken).then((value) {
      setState(() {
        print(value.body);

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
                  "E Prescription Delete",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      itemCount: doctorAppointmentDelete.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorEPrescriptionDeleteDeletetTile(
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

Widget buildDoctorEPrescriptionDeleteDeletetTile(DoctorDeleteEPrescriptionResponse doctorAppointmentDelete) =>
    SingleChildScrollView(
      child: Center(
        child: Text(doctorAppointmentDelete.message),
      ),
    );