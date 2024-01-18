import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/calendar_model.dart';

class EventController extends GetxController {
  TextEditingController eventController = TextEditingController();
  DateTime today = DateTime.now();
  DateTime? selectedDay;

  Map<DateTime, List<EventModel>> events = {};

  RxList<EventModel> selectedEvent = <EventModel>[].obs;

  List<EventModel> getEventForDay(DateTime day) {
    return events[day] ?? [];
  }

  void onDaySelected(DateTime today, DateTime selectedDay) {
    if (selectedDay != null && !isSameDay(this.selectedDay!, selectedDay)) {
      this.today = today;
      this.selectedDay = selectedDay;
      selectedEvent.value = getEventForDay(this.selectedDay!);
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedDay = today;
    selectedEvent.value = getEventForDay(selectedDay!);
    eventController.clear();
  }
}
