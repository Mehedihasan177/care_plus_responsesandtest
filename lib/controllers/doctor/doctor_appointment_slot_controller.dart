

import 'package:care_plus_responsesandtest/constents/constant.dart';
import 'package:http/http.dart' as http;
class DoctorAppointmentSlotController{

static Future<http.Response> requestThenResponsePrint(String token) async {

String domain = apiDomainRoot;

var url = '$domain/api/doctor/appointment-slot/10';

var response = await http.get(Uri.parse(url),
headers: {
"Accept": "application/json",
'Authorization': 'Bearer $token',
}
);
return response;
}

}