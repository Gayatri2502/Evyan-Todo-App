import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/presentation/scheduling_screen/models/scheduling_model.dart';

class SchedulingController extends GetxController {
  Rx<SchedulingModel> schedulingModelObj = SchedulingModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
