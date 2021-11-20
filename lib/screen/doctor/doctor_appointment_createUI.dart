import 'package:care_plus_responsesandtest/controllers/doctor/doctor_appointment_create_controller.dart';
import 'package:care_plus_responsesandtest/helper/alertDialogue.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_appointment_create_slot_model.dart';
import 'package:flutter/material.dart';

class DoctorAppointmentCreateUI extends StatefulWidget {
  final String Usertoken;
  const DoctorAppointmentCreateUI({Key? key, required this.Usertoken}) : super(key: key);

  @override
  _DoctorAppointmentCreateUIState createState() => _DoctorAppointmentCreateUIState();
}

class _DoctorAppointmentCreateUIState extends State<DoctorAppointmentCreateUI> {

  String finalToken = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            "Doctor create appointment schedule",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            //EasyLoading.show(status: 'loading...');
            DoctorAppointmentCreateSlotModel myInfo = new DoctorAppointmentCreateSlotModel(
                start_time: '10 AM',
                end_time: '20 AM',
                day: ["Monday", "Sunday", "Friday"]

            );
            await DoctorAppointmentCreateSlotController
                .requestThenResponsePrint(myInfo, widget.Usertoken).then((
                value) async {
              print(value.statusCode);
              print(value.body);
              //EasyLoading.dismiss();
              if (value.statusCode == 200) {
                print("successfully set schedule");
              }

              else {
                AlertDialogueHelper().showAlertDialog(context, 'Warning',
                    'Something is missing');
              }
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF1A150D),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)),
          ),
        ),
      ),

    );
  }
}