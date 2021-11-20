import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:http/http.dart' as http;
class UserByAppointmentSlotController{

  static Future<http.Response> requestThenResponsePrint(String appointment_slot_id, String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/doctor/user-by-appointment-slot';

    Map doctorcashout = {
      'amount': "${appointment_slot_id}",
    };
    var response = await http.post(Uri.parse(url), body: doctorcashout,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}