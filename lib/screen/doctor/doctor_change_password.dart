import 'package:care_plus_responsesandtest/controllers/doctor/doctor_change_password_controller.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_change_password_model.dart';
import 'package:flutter/material.dart';

class DoctorChangePassword extends StatefulWidget {
  final String Usertoken;
  const DoctorChangePassword({Key? key, required this.Usertoken}) : super(key: key);

  @override
  _DoctorChangePasswordState createState() => _DoctorChangePasswordState();
}

class _DoctorChangePasswordState extends State<DoctorChangePassword> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            "change password",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            print("token of user\n");
            print("token at call mehedi hasan who are you: " + widget.Usertoken);
            DoctorPasswordChangeModel passChange = new DoctorPasswordChangeModel("12345678900", "123456789", "123456789");

            DoctorChangePasswordController.requestThenResponsePrint(context, widget.Usertoken, passChange).then((value) {
              print('dddddddd');
              print(value.statusCode);
              if (value.statusCode == 200) {
                print("successfully done");
                // if (yOn == 0) {
                //   navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => ChangePasswordSuccessPage()));
                // } else {
                //   SigninController.requestThenResponsePrint(context, widget.userType, widget.userPhone, newPassC.text);
                // }
              }else{
                // BasicFunctions.showAlertDialogTOView(context,
                //     AppLocalizations.of(context).translate("passwordRecheckTitle"),
                //     AppLocalizations.of(context).translate("passwordRecheckMessage"));
                // BasicFunctions.showAlertDialogTOView(context, "Warning", "Please recheck your passwords to change");
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
