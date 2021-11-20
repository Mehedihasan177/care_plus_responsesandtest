import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_appointment_create_slot_model.dart';
import 'package:care_plus_responsesandtest/models/doctor/doctor_registration_model.dart';
import 'package:care_plus_responsesandtest/models/user/reg_requst_model.dart';
import 'package:care_plus_responsesandtest/responses/doctor/doctor_registration_responses.dart';
import 'package:http/http.dart' as http;
class DoctorAppointmentCreateSlotController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(DoctorAppointmentCreateSlotModel doctorAppointmentCreateSlotModel, String token) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor/appointment-slot';

    Map data1 = {
      'day': "${doctorAppointmentCreateSlotModel.day}",
      'start_time': "${doctorAppointmentCreateSlotModel.start_time}",
      'end_time': "${doctorAppointmentCreateSlotModel.end_time}",

    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: data1,
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