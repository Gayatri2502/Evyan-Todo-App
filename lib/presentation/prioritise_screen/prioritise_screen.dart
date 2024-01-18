import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/widgets/app_bar/appbar_image.dart';
import 'package:todo_app/widgets/app_bar/appbar_title.dart';
import 'package:todo_app/widgets/app_bar/custom_app_bar.dart';

import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import 'controller/prioritise_controller.dart';

class PrioritiseScreen extends GetWidget<PrioritiseController> {
  DateTime today = DateTime.now().toUtc();

  String getCurrentDayOfWeek() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE').format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        appBar: CustomAppBar(
          height: getVerticalSize(49),
          leadingWidth: 40,
          leading: AppbarImage(
            height: getSize(24),
            width: getSize(24),
            svgPath: ImageConstant.imgArrowLeft,
            margin: getMargin(left: 16, top: 12, bottom: 13),
            onTap: () {
              onTapArrowleft2();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "Prioritise your Task"),
          actions: [
            AppbarImage(
              height: getSize(24),
              width: getSize(24),
              svgPath: ImageConstant.imgOverflowmenu1,
              margin: getMargin(left: 16, top: 12, right: 16, bottom: 13),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 16, top: 28),
                  child: Text(
                    "This Week",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroySemiBold20,
                  ),
                ),
                Padding(
                  padding: getPadding(left: 16, top: 31),
                  child: Text(
                    "${getCurrentDayOfWeek()} ${today.day}th",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroySemiBold16BlueA700,
                  ),
                ),
                buildTaskTile(
                  "Buy Groceries",
                  "low priority",
                ),
                buildTaskTile(
                  "Cardio",
                  "low priority",
                ),
                buildTaskTile(
                  "Dinner with family",
                  "high priority",
                ),
                buildTaskTile(
                  "Pay college fees",
                  "low priority",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTaskTile(String title, String priority) {
    return Dismissible(
      key: Key(title), // Unique key for each item
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // Handle dismiss (in this case, you can delete the task)
        if (direction == DismissDirection.endToStart) {
          controller.deleteTask(title);
        }
      },
      background: Container(
        color: Colors.red, // Background color when sliding to delete
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Container(
        margin: getMargin(left: 16, top: 16, right: 16),
        padding: getPadding(left: 16, top: 17, right: 16, bottom: 17),
        decoration: AppDecoration.outlineGray70011.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtGilroySemiBold16Gray90001,
                ),
                SizedBox(height: getVerticalSize(6)),
                Text(
                  priority,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  // style: AppStyle.txtGilroyRegular14Gray900,
                ),
              ],
            ),
            CustomButton(
              height: getVerticalSize(23),
              width: getHorizontalSize(81),
              text: "low priority",
              margin: getMargin(bottom: 1),
              variant: ButtonVariant.FillDeeporangeA10019,
              fontStyle: ButtonFontStyle.GilroyMedium12Deeporange400,
            ),
          ],
        ),
      ),
    );
  }

  onTapArrowleft2() {
    Get.back();
  }
}
