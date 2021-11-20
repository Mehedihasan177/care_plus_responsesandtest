import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/user/reg_requst_model.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_update_E_prescription_responses.dart';
import 'package:care_plus_responsesandtest/responses/user/child_by_health_id_responses.dart';
import 'package:care_plus_responsesandtest/responses/user/seperate_child_responses.dart';
import 'package:http/http.dart' as http;
class UpdateEPrescriptionController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(UpdateEPrescription updateEPrescription, String token) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor/e-prescription/2';

    Map ePrescription = {
      'userId': "${updateEPrescription.userId}",
      'appointmentScheduleId': "${updateEPrescription.appointmentScheduleId}",
      'advice': "${updateEPrescription.advice}",
      'cc': "${updateEPrescription.cc}",

    };

    // Here we are getting the response
    var response = await http.put(Uri.parse(url), body: ePrescription,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}