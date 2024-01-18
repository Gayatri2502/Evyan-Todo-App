import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/prioritise_model.dart';

class PrioritiseController extends GetxController {
  Rx<PrioritiseModel> prioritiseModelObj = PrioritiseModel().obs;

  // Method to perform an action on the task
  void performAction(String taskTitle) {
    // Add your logic here for performing the action
    print("Action performed on task: $taskTitle");
  }

  // Method to delete a task
  void deleteTask(String taskTitle) {
    // Add your logic here for deleting the task
    print("Task deleted: $taskTitle");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

// Align(
// alignment: Alignment.center,
// child: Container(
// margin: getMargin(left: 16, top: 16, right: 16),
// padding: getPadding(
// left: 16, top: 17, right: 16, bottom: 17),
// decoration: AppDecoration.outlineGray70011.copyWith(
// borderRadius: BorderRadiusStyle.roundedBorder6),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Padding(
// padding: getPadding(top: 2, bottom: 1),
// child: Text("Cardio".tr,
// overflow: TextOverflow.ellipsis,
// textAlign: TextAlign.left,
// style: AppStyle
//     .txtGilroySemiBold16Gray90001)),
// CustomButton(
// height: getVerticalSize(23),
// width: getHorizontalSize(81),
// text: "low priority",
// margin: getMargin(bottom: 1),
// variant: ButtonVariant.FillDeeporangeA10019,
// fontStyle: ButtonFontStyle
// .GilroyMedium12Deeporange400)
// ]))),
