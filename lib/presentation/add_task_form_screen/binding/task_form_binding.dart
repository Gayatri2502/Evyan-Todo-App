import 'package:get/get.dart';

import '../controller/task_form_controller.dart';

/// A binding class for the AdacanaScreen.
///
/// This class ensures that the AdacanaController is created when the
/// AdacanaScreen is first loaded.
class TaskFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskFormController());
  }
}
