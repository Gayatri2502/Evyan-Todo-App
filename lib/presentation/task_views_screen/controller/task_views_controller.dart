import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/presentation/task_views_screen/models/task_views_model.dart';

class TaskViewsController extends GetxController {
  Rx<TaskViewsModel> taskViewsModelObj = TaskViewsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
