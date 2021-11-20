import 'package:care_plus_responsesandtest/controllers/miscellaneous/child_by_health_id_controller.dart';
import 'package:care_plus_responsesandtest/models/miscellaneous/child_health_id_model.dart';
import 'package:flutter/material.dart';

class HealthIDUI extends StatefulWidget {
  final String Usertoken;
  const HealthIDUI({Key? key,required this.Usertoken}) : super(key: key);

  @override
  _HealthIDUIState createState() => _HealthIDUIState();
}

class _HealthIDUIState extends State<HealthIDUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            "Health id",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async{

            print("token of user\n");
            print("token at call mehedi hasan who are you: " + widget.Usertoken);
            ChildHealthIDModel ePrescription = new ChildHealthIDModel(
              health_id: 'MMDR21111919353517',

            );
            await ChildByHealthIdController.requestThenResponsePrint(context, widget.Usertoken, ePrescription).then((value) async {
              print(value.statusCode);
              print(value.body);
              //EasyLoading.dismiss();
              if(value.statusCode==200) {
                print("successfully done");
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
