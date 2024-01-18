import 'package:get/get.dart';
import 'package:todo_app/presentation/task_list_screen/models/task_list_model.dart';

class MyTaskController extends GetxController {
  Rx<TaskListModel> taskListModelObj = TaskListModel().obs;
  //
  // @override
  // void onReady() {
  //   super.onReady();
  //   Future.delayed(const Duration(milliseconds: 3000), () {
  //     Get.offNamed(
  //       AppRoutes.taskViewsScreen,
  //     );
  //   });
  // }

  @override
  void onClose() {
    super.onClose();
  }
}
