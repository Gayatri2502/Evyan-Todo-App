import 'package:get/get.dart';
import 'package:todo_app/presentation/calendar_screen/controller/event_controller.dart';

class CalendarScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EventController>(EventController());
  }
}
