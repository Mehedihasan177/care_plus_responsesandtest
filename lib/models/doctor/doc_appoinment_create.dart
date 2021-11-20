// To parse this JSON data, do
//
//     final docAppoinmentCreate = docAppoinmentCreateFromJson(jsonString);

import 'dart:convert';

// DocAppoinmentCreate docAppoinmentCreateFromJson(String str) => DocAppoinmentCreate.fromJson(json.decode(str));

String docAppoinmentCreateToJson(DocAppoinmentCreateSlot data) => json.encode(data.toJson());

class DocAppoinmentCreateSlot {
  DocAppoinmentCreateSlot(
    this.day,
    this.startTime,
    this.endTime,
  );

  List<String> day;
  String startTime;
  String endTime;

  // factory DocAppoinmentCreate.fromJson(Map<String, dynamic> json) => DocAppoinmentCreate(
  //   day: List<String>.from(json["day"].map((x) => x)),
  //   startTime: json["start_time"],
  //   endTime: json["end_time"],
  // );

  Map<String, dynamic> toJson() => {
    "day": List<dynamic>.from(day.map((x) => x)),
    "start_time": startTime,
    "end_time": endTime,
  };
}
