import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/presentation/calendar_screen/calendar_screen.dart';
import 'package:todo_app/widgets/app_bar/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_elevated_button.dart';
import 'package:todo_app/widgets/custom_icon_button.dart';

import 'controller/work_today_controller.dart';

class WorkTodayScreen extends GetWidget<WorkTodayController> {
  WorkTodayScreen({Key? key}) : super(key: key);
  GlobalKey<SliderDrawerState> dKey = GlobalKey<SliderDrawerState>();
  DateTime today = DateTime.now().toUtc();
  String formattedDate = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SliderDrawer(
      isDraggable: false,
      key: dKey,
      animationDuration: 1000,

      /// My AppBar
      appBar: MyAppBar(
        drawerKey: dKey,
      ),

      /// My Drawer Slider
      slider: MySlider(),
      child: SingleChildScrollView(
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 3.v),
            child: Column(children: [
              // CustomIconButton(
              //     height: 24.adaptSize,
              //     width: 24.adaptSize,
              //     alignment: Alignment.centerLeft,
              //     onTap: () {
              //       onTapBtnArrowLeft();
              //     },
              //     child: CustomImageView(
              //         imagePath: ImageConstant.imgArrowLeftBlack900)),
              SizedBox(height: 1.v),
              _buildPageHeader(),
              SizedBox(height: 58.v),
              _buildDate(),
              SizedBox(height: 59.v),
              _buildTodoFeatureItem("My Task", AppRoutes.myTaskScreen),
              _buildTodoFeatureItem(
                  "Task Management", AppRoutes.taskViewsScreen),
              _buildTodoFeatureItem(
                  "Working hours on Task ", AppRoutes.progressTimePicker),
              _buildTodoFeatureItem(
                  "Prioritise your Task", AppRoutes.prioritiseScreen),
              SizedBox(height: 56.v),
              CustomElevatedButton(
                  text: "Create a new Task".tr,
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                  onPressed: () {
                    Get.toNamed(AppRoutes.taskFormScreen);
                  }),
              SizedBox(height: 5.v)
            ])),
      ),
    )));
  }

  /// Section Widget
  Widget _buildPageHeader() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Schedule your task with following features!".tr,
          style: theme.textTheme.headlineMedium),
      SizedBox(height: 7.v),
      Text("msg_make_your_job_easier".tr, style: theme.textTheme.labelLarge)
    ]);
  }

  /// Section Widget
  Widget _buildDate() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 6.v, bottom: 2.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("lbl_today".tr, style: CustomTextStyles.titleSmallBlack900),
            SizedBox(height: 5.v),
            Text("${today.day}-${today.month}-${today.year}".tr,
                style: CustomTextStyles.titleMediumBlack900)
          ])),
      CustomIconButton(
          onTap: () {
            // Get.toNamed(
            //   AppRoutes.calendarScreen,
            // );
            Get.to(() => CalendarScreen());
          },
          height: 58.v,
          width: 60.h,
          padding: EdgeInsets.all(17.h),
          decoration: IconButtonStyleHelper.fillGray,
          child: CustomImageView(imagePath: ImageConstant.imgCalendar))
    ]);
  }

  /// Section Widget
  Widget _buildTodoFeatureItem(String featureName, AppRoutes) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes);
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 15.v),
          decoration: AppDecoration.fillWhiteA,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                height: 26.v,
                width: 28.h,
                decoration: BoxDecoration(
                    color:
                        theme.colorScheme.secondaryContainer.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6.h))),
            Padding(
                padding: EdgeInsets.only(left: 13.h, top: 3.v, bottom: 2.v),
                child:
                    Text("${featureName}", style: theme.textTheme.bodyMedium)),
            Spacer(),
            CustomImageView(
                imagePath: ImageConstant.imgArrowIcon,
                height: 5.v,
                width: 3.h,
                margin: EdgeInsets.symmetric(vertical: 10.v))
          ])),
    );
  }

  /// Navigates to the previous screen.
  onTapBtnArrowLeft() {
    Get.back();
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapMakeAWishList() {
    Get.toNamed(
      AppRoutes.signupScreen,
    );
  }
}
