import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:care_plus_responsesandtest/models/user/reg_requst_model.dart';
import 'package:care_plus_responsesandtest/responses/user/create_appointment_schedule.dart';
import 'package:http/http.dart' as http;
class CreateAppointmentScheduleController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(CreateAppointmentSchedule createAppointmentSchedule, String token) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user/appointment-schedule';

    Map data1 = {
      'UserID': "${createAppointmentSchedule.userId}",
      'doctorID': "${createAppointmentSchedule.doctorId}",
      'appointmentSlot': "${createAppointmentSchedule.appointmentSlotId}",
      'date': "${createAppointmentSchedule.date}",

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