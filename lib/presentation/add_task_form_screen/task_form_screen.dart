import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/calendar_screen/model/calendar_model.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/date_range_picker.dart';
import '../calendar_screen/calendar_screen.dart';
import 'controller/task_form_controller.dart';

class TaskFormScreen extends GetWidget<TaskFormController> {
  @override
  Widget build(BuildContext context) {
    Time _time = Time(hour: 11, minute: 30, second: 20);
    DateTime _today = DateTime.now();

    final DateTime _selectedDay = _today;
    EventModel eventModel = EventModel(time: _time, date: _selectedDay);

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(49),
                leadingWidth: 40,
                leading: CustomImageView(
                    svgPath: ImageConstant.imgArrowleft,
                    height: getSize(24),
                    width: getSize(24),
                    margin: getMargin(left: 16, top: 12, bottom: 13),
                    onTap: () {
                      onTapImgArrowleft();
                    }),
                centerTitle: true,
                title: Text("Create New Task:".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroySemiBold24)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 27, right: 16, bottom: 27),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Title:".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtGilroyMedium16),
                            CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.taskNameController,
                              hintText: "Task name".tr,
                            )
                          ]),
                      Padding(
                          padding: getPadding(top: 20),
                          child: Text("Description:".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroyMedium16)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.descriptionController,
                          hintText: "Write your task description.....".tr,
                          textInputAction: TextInputAction.done,
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 30, right: 7, bottom: 7),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgEdit)),
                          suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(190)),
                          maxLines: 4),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CalendarScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 50,
                          width: 350,
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text(
                                "Select the date and time : ",
                                style: TextStyle(
                                    color: Colors.indigo, fontSize: 15),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1))),
                                height: 30,
                                width: 80,
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    "${eventModel.date}/t at ${eventModel.time}"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1))),
                                height: 30,
                                width: 50,
                                padding: EdgeInsets.all(8),
                                child:
                                    Text("${eventModel.time.format(context)}"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 150,
                          width: 350,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Time period of your task : "),
                              Spacer(),
                              Spacer(),
                              LongTermTask(),
                            ],
                          )),
                      Spacer(),
                      CustomButton(
                          onTap: () async {
                            // Show loading dialog
                            Get.dialog(
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                              barrierDismissible: false,
                            );
                            await Future.delayed(Duration(seconds: 2));
                            Get.back();
                            Get.defaultDialog(
                              title: 'Task Saved',
                              middleText:
                                  'Your task has been successfully saved!',
                              textConfirm: 'OK',
                              confirm: ElevatedButton(
                                onPressed: () {
                                  // Close the success dialog
                                  Get.back();
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                          height: getVerticalSize(50),
                          text: "Save My Task".tr,
                          margin: getMargin(bottom: 65)),
                    ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
