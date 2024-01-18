import 'package:flutter/material.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/widgets/custom_button.dart';

import '../../theme/app_style.dart';
import 'controller/task_views_controller.dart';

class TaskViewsScreen extends GetWidget<TaskViewsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        // appBar: CustomAppBar(
        //     bottom: const TabBar(
        //       tabs: [
        //         Tab(icon: Icon(Icons.directions_car)),
        //         Tab(icon: Icon(Icons.directions_transit)),
        //         Tab(icon: Icon(Icons.directions_bike)),
        //       ],
        //     ),
        //     height: getVerticalSize(53),
        //     leadingWidth: 40,
        //     leading: AppbarImage(
        //         height: getSize(24),
        //         width: getSize(24),
        //         svgPath: ImageConstant.imgArrowleft,
        //         margin: getMargin(left: 16, top: 12, bottom: 17),
        //         onTap: () {
        //           onTapArrowleft5();
        //         }),
        //     centerTitle: true,
        //     title: AppbarTitle(text: "Task Management"),
        //     actions: [
        //       AppbarImage(
        //           height: getSize(24),
        //           width: getSize(24),
        //           svgPath: ImageConstant.imgOverflowmenu1,
        //           margin:
        //               getMargin(left: 16, top: 12, right: 16, bottom: 17))
        //     ]),

        appBar: AppBar(
          centerTitle: true,
          title: Text("Task Management"),
          bottom: TabBar(
            tabs: [
              Text("All"),
              Text("On going"),
              Text("on Hold"),
              Text("Finished"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[allTab(), onGoing(), onHold(), completed()],
        ),
      ),
    ));
  }

  onTapArrowleft5() {
    Get.back();
  }
}

Widget allTab() {
  return Container(
      width: double.maxFinite,
      padding: getPadding(left: 16, top: 33, right: 16, bottom: 33),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        // Container(
        //     height: getVerticalSize(39),
        //     width: getHorizontalSize(396),
        //     child: Stack(alignment: Alignment.bottomCenter, children: [
        //       Align(
        //           alignment: Alignment.center,
        //           child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Container(
        //                     width: getHorizontalSize(38),
        //                     child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         children: [
        //                           Text("All",
        //                               overflow: TextOverflow.ellipsis,
        //                               textAlign: TextAlign.left,
        //                               style: AppStyle.txtGilroyMedium16),
        //                           Padding(
        //                               padding: getPadding(top: 18),
        //                               child: SizedBox(
        //                                   width: getHorizontalSize(38),
        //                                   child: Divider(
        //                                       height: getVerticalSize(2),
        //                                       thickness: getVerticalSize(2),
        //                                       color: ColorConstant.blueA700)))
        //                         ])),
        //                 Padding(
        //                     padding: getPadding(left: 34, top: 3, bottom: 16),
        //                     child: Text("On going",
        //                         overflow: TextOverflow.ellipsis,
        //                         textAlign: TextAlign.left,
        //                         style: AppStyle.txtGilroyMedium16Bluegray400)),
        //                 Padding(
        //                     padding: getPadding(left: 44, top: 2, bottom: 18),
        //                     child: Text("On hold",
        //                         overflow: TextOverflow.ellipsis,
        //                         textAlign: TextAlign.left,
        //                         style: AppStyle.txtGilroyMedium16Bluegray400)),
        //                 Padding(
        //                     padding: getPadding(left: 44, top: 3, bottom: 16),
        //                     child: Text("Completed",
        //                         overflow: TextOverflow.ellipsis,
        //                         textAlign: TextAlign.left,
        //                         style: AppStyle.txtGilroyMedium16Bluegray400))
        //               ])),
        //       Align(
        //           alignment: Alignment.bottomCenter,
        //           child: Padding(
        //               padding: getPadding(bottom: 1),
        //               child: SizedBox(
        //                   width: getHorizontalSize(396),
        //                   child: Divider(
        //                       height: getVerticalSize(1),
        //                       thickness: getVerticalSize(1),
        //                       color: ColorConstant.blueGray100))))
        //     ])),
        Padding(
            padding: getPadding(top: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: getPadding(top: 8, bottom: 3),
                      child: Text("Project_1",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium18)),
                  CustomButton(
                      height: getVerticalSize(34),
                      width: getHorizontalSize(56),
                      text: "Started",
                      padding: ButtonPadding.PaddingAll6)
                ])),
        Padding(
            padding: getPadding(top: 16),
            child: Divider(
                height: getVerticalSize(1),
                thickness: getVerticalSize(1),
                color: ColorConstant.blueGray100)),
        Padding(
            padding: getPadding(top: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: getPadding(top: 8, bottom: 3),
                      child: Text("Project_2",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium18)),
                  CustomButton(
                      height: getVerticalSize(34),
                      width: getHorizontalSize(97),
                      text: "Completed",
                      variant: ButtonVariant.FillGreen600,
                      padding: ButtonPadding.PaddingAll6)
                ])),
        Padding(
            padding: getPadding(top: 16),
            child: Divider(
                height: getVerticalSize(1),
                thickness: getVerticalSize(1),
                color: ColorConstant.blueGray100)),
        Padding(
            padding: getPadding(top: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: getPadding(top: 8, bottom: 3),
                      child: Text("Project_3",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium18)),
                  CustomButton(
                      height: getVerticalSize(34),
                      width: getHorizontalSize(56),
                      text: "Started",
                      padding: ButtonPadding.PaddingAll6)
                ])),
        Padding(
            padding: getPadding(top: 16),
            child: Divider(
                height: getVerticalSize(1),
                thickness: getVerticalSize(1),
                color: ColorConstant.blueGray100)),
        Padding(
            padding: getPadding(top: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: getPadding(top: 8, bottom: 3),
                      child: Text("Project_4",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium18)),
                  CustomButton(
                      height: getVerticalSize(34),
                      width: getHorizontalSize(97),
                      text: "Completed",
                      variant: ButtonVariant.FillGreen600,
                      padding: ButtonPadding.PaddingAll6)
                ])),
        Padding(
            padding: getPadding(top: 16),
            child: Divider(
                height: getVerticalSize(1),
                thickness: getVerticalSize(1),
                color: ColorConstant.blueGray100)),
        Padding(
            padding: getPadding(top: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: getPadding(top: 8, bottom: 3),
                      child: Text("Project_5",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroyMedium18)),
                  CustomButton(
                      height: getVerticalSize(34),
                      width: getHorizontalSize(56),
                      text: "Started",
                      padding: ButtonPadding.PaddingAll6)
                ])),
        Spacer(),
        CustomButton(
            onTap: () {
              Get.toNamed(AppRoutes.taskFormScreen);
            },
            height: getVerticalSize(50),
            text: "Add Task ",
            margin: getMargin(bottom: 56),
            padding: ButtonPadding.PaddingAll15,
            fontStyle: ButtonFontStyle.GilroyMedium16)
      ]));
}

Widget onGoing() {
  return Container(
      child: Center(
    child: Text('On Going ....'),
  ));
}

Widget onHold() {
  return Container(
      child: Center(
    child: Text('On Hold ....'),
  ));
}

Widget completed() {
  return Container(
      child: Center(
    child: Text('Completed ....'),
  ));
}
