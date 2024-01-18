import 'package:get/get.dart';

import '../controller/task_list_controller.dart';

class TaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTaskController());
  }
}
