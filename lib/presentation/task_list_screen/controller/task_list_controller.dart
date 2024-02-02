import 'package:get/get.dart';
import 'package:todo_app/presentation/task_list_screen/models/task_list_model.dart';

import '../../../data/models/task.dart';

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

  /// Checking Done Tasks
  int checkDoneTask(List<Task> task) {
    int i = 0;
    for (Task doneTasks in task) {
      if (doneTasks.isCompleted) {
        i++;
      }
    }
    return i;
  }

  /// Checking The Value Of the Circle Indicator
  dynamic valueOfTheIndicator(List<Task> task) {
    if (task.isNotEmpty) {
      return task.length;
    } else {
      return 3;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
