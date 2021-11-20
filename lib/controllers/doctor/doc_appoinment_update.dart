class DocAppoinmentUpdate{
  List <String> day;
  String startTime,endTime;
  int id;
  DocAppoinmentUpdate(this.day, this.startTime, this.endTime, this.id);

  Map<String, dynamic> toJson() => {
    "day": List<dynamic>.from(day.map((x) => x)),
    "start_time": startTime,
    "end_time": endTime,
    "id": id,
  };
}