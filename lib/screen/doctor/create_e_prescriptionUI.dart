import 'package:care_plus_responsesandtest/controllers/doctor/create_e_prescription_doctor.dart';
import 'package:care_plus_responsesandtest/responses/doctor/create_E_prescription_response.dart';
import 'package:flutter/material.dart';

class CreateEPrescriptionUI extends StatefulWidget {
  final String Usertoken;
  const CreateEPrescriptionUI({Key? key, required this.Usertoken}) : super(key: key);

  @override
  _CreateEPrescriptionUIState createState() => _CreateEPrescriptionUIState();
}

class _CreateEPrescriptionUIState extends State<CreateEPrescriptionUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            "E Prescription",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async{

            print("token of user\n");
            print("token at call mehedi hasan who are you: " + widget.Usertoken);
            CreateEPrescriptionModel ePrescription = new CreateEPrescriptionModel(
              userId: '1',
              appointment_schedule_id: '2',
              advice: '1',
              cc: '1',
              id: '1',
              createdAt: "q",
              updatedAt: "ss",
              doctorId: '1',

            );
            await CreateEPrescriptionController.requestThenResponsePrint(context, widget.Usertoken, ePrescription).then((value) async {
              print(value.statusCode);
              print(value.body);
              //EasyLoading.dismiss();
              if(value.statusCode==200) {
                print("successfully done");
              }
            });

          },
          // onPressed: () {
          //   print("token of user\n");
          //   print("token at call mehedi hasan who are you: " + widget.Usertoken);
          //   CreateEPrescriptionModel ePrescription = new CreateEPrescriptionModel(
          //       userId: '1',
          //       appointmentScheduleId: '2',
          //       advice: '1',
          //       cc: '1',
          //       id: '1',
          //     createdAt: "q",
          //     updatedAt: "ss",
          //       doctorId: '1',
          //
          //       );
          //
          //   CreateEPrescriptionController.requestThenResponsePrint(context, widget.Usertoken, ePrescription).then((value) {
          //     print('dddddddd');
          //     print(value.statusCode);
          //     if (value.statusCode == 200) {
          //       print("successfully done");
          //       // if (yOn == 0) {
          //       //   navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => ChangePasswordSuccessPage()));
          //       // } else {
          //       //   SigninController.requestThenResponsePrint(context, widget.userType, widget.userPhone, newPassC.text);
          //       // }
          //     }else{
          //       // BasicFunctions.showAlertDialogTOView(context,
          //       //     AppLocalizations.of(context).translate("passwordRecheckTitle"),
          //       //     AppLocalizations.of(context).translate("passwordRecheckMessage"));
          //       // BasicFunctions.showAlertDialogTOView(context, "Warning", "Please recheck your passwords to change");
          //     }
          //   });
          // },
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

