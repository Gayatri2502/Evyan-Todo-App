import '../controller/prioritise_controller.dart';
import 'package:get/get.dart';

class PrioritiseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrioritiseController());
  }
}
