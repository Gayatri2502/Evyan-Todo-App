import 'package:day_night_time_picker/day_night_time_picker.dart';

class EventModel {
  final DateTime date;
  final Time time;
  EventModel({required this.time, required this.date});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'date': date, 'time': time};
  }
}
