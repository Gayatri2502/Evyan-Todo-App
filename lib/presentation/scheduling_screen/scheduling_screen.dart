import 'package:flutter/material.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/widgets/app_bar/appbar_image.dart';
import 'package:todo_app/widgets/app_bar/appbar_title.dart';
import 'package:todo_app/widgets/app_bar/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_button.dart';

import '../../theme/app_style.dart';
import '../scheduling_screen/widgets/scheduling_item_widget.dart';
import 'controller/scheduling_controller.dart';
import 'models/scheduling_item_model.dart';

class SchedulingScreen extends GetWidget<SchedulingController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(48),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 12, bottom: 12),
                    onTap: () {
                      onTapArrowleft();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_schedule".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 34, right: 16, bottom: 34),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("lbl_24".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtGilroySemiBold44),
                                  Container(
                                      width: getHorizontalSize(60),
                                      margin: getMargin(
                                          left: 12, top: 7, bottom: 6),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("lbl_wed".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    AppStyle.txtGilroyMedium14),
                                            Padding(
                                                padding: getPadding(top: 4),
                                                child: Text("lbl_jan_2020".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtGilroyMedium14))
                                          ]))
                                ]),
                            CustomButton(
                                height: getVerticalSize(40),
                                width: getHorizontalSize(83),
                                text: "lbl_today".tr,
                                margin: getMargin(top: 7, bottom: 5),
                                variant: ButtonVariant.FillBlueA70063,
                                padding: ButtonPadding.PaddingAll6,
                                fontStyle: ButtonFontStyle.GilroySemiBold18)
                          ]),
                      Padding(
                          padding: getPadding(left: 1, top: 22, right: 3),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: getPadding(top: 10, bottom: 3),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_s".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtGilroySemiBold12),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text("lbl_21".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtGilroySemiBold16))
                                        ])),
                                Padding(
                                    padding: getPadding(top: 10, bottom: 3),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_m".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtGilroySemiBold12),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text("lbl_22".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtGilroySemiBold16))
                                        ])),
                                Padding(
                                    padding: getPadding(top: 10, bottom: 3),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_t".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtGilroySemiBold12),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text("lbl_23".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtGilroySemiBold16))
                                        ])),
                                Container(
                                    padding: getPadding(
                                        left: 14, top: 6, right: 14, bottom: 6),
                                    decoration: AppDecoration.fillBlueA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: getPadding(left: 2),
                                              child: Text("lbl_w".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtGilroySemiBold12WhiteA700)),
                                          Padding(
                                              padding:
                                                  getPadding(top: 5, bottom: 1),
                                              child: Text("lbl_242".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtGilroySemiBold16WhiteA700))
                                        ])),
                                Padding(
                                    padding: getPadding(top: 10, bottom: 3),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_t".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtGilroySemiBold12),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text("lbl_25".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtGilroySemiBold16))
                                        ])),
                                Padding(
                                    padding: getPadding(top: 10, bottom: 3),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_f".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtGilroySemiBold12),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text("lbl_26".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtGilroySemiBold16))
                                        ])),
                                Padding(
                                    padding: getPadding(top: 10, bottom: 3),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_s".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtGilroySemiBold12),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text("lbl_27".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtGilroySemiBold16))
                                        ]))
                              ])),
                      Padding(
                          padding: getPadding(top: 26, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(top: 5, bottom: 188),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_time".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtGilroySemiBold14),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: getPadding(top: 22),
                                                  child: Text("lbl_11_35".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtGilroySemiBold16))),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                  padding: getPadding(top: 8),
                                                  child: Text("lbl_13_05".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtGilroySemiBold14))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: getPadding(top: 107),
                                                  child: Text("lbl_13_15".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtGilroySemiBold16))),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                  padding: getPadding(top: 8),
                                                  child: Text("lbl_14_45".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtGilroySemiBold14))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: getPadding(top: 107),
                                                  child: Text("lbl_15_10".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtGilroySemiBold16))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: getPadding(top: 8),
                                                  child: Text("lbl_16_40".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtGilroySemiBold14)))
                                        ])),
                                SizedBox(
                                    height: getVerticalSize(585),
                                    child: VerticalDivider(
                                        width: getHorizontalSize(2),
                                        thickness: getVerticalSize(2),
                                        color: ColorConstant.blue200,
                                        indent: getHorizontalSize(43))),
                                Container(
                                    height: getVerticalSize(486),
                                    width: getHorizontalSize(327),
                                    margin: getMargin(bottom: 99),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgSort,
                                              height: getSize(24),
                                              width: getSize(24),
                                              alignment: Alignment.topRight),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("lbl_course".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtGilroySemiBold14),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 20),
                                                        child: Obx(() =>
                                                            ListView.separated(
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                separatorBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return SizedBox(
                                                                      height:
                                                                          getVerticalSize(
                                                                              16));
                                                                },
                                                                itemCount: controller
                                                                    .schedulingModelObj
                                                                    .value
                                                                    .schedulingItemList
                                                                    .value
                                                                    .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  SchedulingItemModel
                                                                      model =
                                                                      controller
                                                                          .schedulingModelObj
                                                                          .value
                                                                          .schedulingItemList
                                                                          .value[index];
                                                                  return SchedulingItemWidget(
                                                                      model);
                                                                })))
                                                  ]))
                                        ]))
                              ]))
                    ]))));
  }

  onTapArrowleft() {
    Get.back();
  }
}
