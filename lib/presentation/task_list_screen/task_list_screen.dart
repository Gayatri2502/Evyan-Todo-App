import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/widgets/app_bar/appbar_image.dart';
import 'package:todo_app/widgets/app_bar/appbar_title.dart';
import 'package:todo_app/widgets/app_bar/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/custom_floating_button.dart';

import '../../theme/app_style.dart';
import 'controller/task_list_controller.dart';

class MyTaskScreen extends GetWidget<MyTaskController> {
  TextEditingController taskTitleController = new TextEditingController();
  TextEditingController taskDescriptionController = new TextEditingController();

  TextEditingController taskController = new TextEditingController();

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
                height: getVerticalSize(53),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 12, bottom: 17),
                    onTap: () {
                      onTapArrowleft1();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "My Tasks"),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgOverflowmenu1,
                      margin:
                          getMargin(left: 16, top: 12, right: 16, bottom: 17))
                ]),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 16, top: 24),
                                child: Text("This Week".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtGilroySemiBold20))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 16, top: 31),
                                child: Text(
                                    "${getCurrentDayOfWeek()} ${today.day}th",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtGilroySemiBold16BlueA700))),
                        Container(
                            margin: getMargin(left: 16, top: 18, right: 16),
                            padding: getPadding(
                                left: 16, top: 17, right: 16, bottom: 17),
                            decoration: AppDecoration.outlineGray70011.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder6),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 3, bottom: 1),
                                      child: Text("Buy groceries",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtGilroySemiBold16Gray90001)),
                                  CustomButton(
                                      height: getVerticalSize(23),
                                      width: getHorizontalSize(85),
                                      text: "High Priority".tr,
                                      margin: getMargin(bottom: 1),
                                      variant: ButtonVariant.FillGray100,
                                      fontStyle: ButtonFontStyle.GilroyMedium12)
                                ])),
                        Container(
                            margin: getMargin(left: 16, top: 16, right: 16),
                            padding: getPadding(
                                left: 16, top: 17, right: 16, bottom: 17),
                            decoration: AppDecoration.outlineGray70011.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder6),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 2, bottom: 1),
                                      child: Text("Cardio at 6pm ".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtGilroySemiBold16Gray90001)),
                                  CustomButton(
                                      height: getVerticalSize(23),
                                      width: getHorizontalSize(81),
                                      text: "Low Priority".tr,
                                      margin: getMargin(bottom: 1),
                                      variant:
                                          ButtonVariant.FillDeeporangeA10033,
                                      fontStyle: ButtonFontStyle
                                          .GilroyMedium12Deeporange400)
                                ])),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 16, top: 24),
                                child: Text("Next Week".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtGilroySemiBold20))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 16, top: 28),
                                child: Text("Wednesday 14th".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtGilroySemiBold16BlueA700))),
                        Container(
                            margin: getMargin(left: 16, top: 17, right: 16),
                            padding: getPadding(
                                left: 16, top: 17, right: 16, bottom: 17),
                            decoration: AppDecoration.outlineGray70011.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder6),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 1, bottom: 2),
                                      child: Text("Dinner with fam ".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtGilroySemiBold16Gray90001)),
                                  CustomButton(
                                      height: getVerticalSize(23),
                                      width: getHorizontalSize(85),
                                      text: "High Priority".tr,
                                      margin: getMargin(bottom: 1),
                                      variant: ButtonVariant.FillGray100,
                                      fontStyle: ButtonFontStyle.GilroyMedium12)
                                ])),
                        Container(
                            margin: getMargin(
                                left: 16, top: 16, right: 16, bottom: 377),
                            padding: getPadding(
                                left: 16, top: 17, right: 16, bottom: 17),
                            decoration: AppDecoration.outlineGray70011.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder6),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 2, bottom: 1),
                                      child: Text("Pay my clg fees".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtGilroySemiBold16Gray90001)),
                                  CustomButton(
                                      height: getVerticalSize(23),
                                      width: getHorizontalSize(81),
                                      text: "Low Priority".tr,
                                      margin: getMargin(bottom: 1),
                                      variant:
                                          ButtonVariant.FillDeeporangeA10033,
                                      fontStyle: ButtonFontStyle
                                          .GilroyMedium12Deeporange400)
                                ]))
                      ])),
            ),
            floatingActionButton: CustomFloatingButton(
              height: 60,
              width: 60,
              child: const Icon(Icons.add),
              onTap: () {
                Get.toNamed(AppRoutes.taskFormScreen);
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         scrollable: true,
                //         title: const Text(
                //           'Create your new task: ',
                //           style: TextStyle(fontSize: 15),
                //         ),
                //         content: Padding(
                //           padding: const EdgeInsets.all(6),
                //           child: TextField(
                //             controller: taskController,
                //           ),
                //         ),
                //         actions: [
                //           ElevatedButton(
                //               onPressed: () {}, child: const Text('Add'))
                //         ],
                //       );
                //     });
              },
            )));
  }

  onTapArrowleft1() {
    Get.back();
  }
}
