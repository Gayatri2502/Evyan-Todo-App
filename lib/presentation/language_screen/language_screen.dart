import 'controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/widgets/custom_elevated_button.dart';
import 'package:todo_app/widgets/custom_icon_button.dart';

class LanguageScreen extends GetWidget<LanguageController> {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 43.v),
                child: Column(children: [
                  CustomIconButton(
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      padding: EdgeInsets.all(6.h),
                      alignment: Alignment.centerLeft,
                      onTap: () {
                        onTapBtnArrowLeft();
                      },
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowLeft)),
                  SizedBox(height: 82.v),
                  _buildPageHeader(),
                  SizedBox(height: 87.v),
                  CustomElevatedButton(
                      text: "lbl_indonesian2".tr,
                      buttonStyle: CustomButtonStyles.fillDeepOrange,
                      buttonTextStyle:
                          CustomTextStyles.labelLargeSecondaryContainer,
                      onPressed: () {
                        onTapIndonesian();
                      }),
                  SizedBox(height: 14.v),
                  CustomElevatedButton(
                      text: "lbl_english".tr,
                      buttonStyle: CustomButtonStyles.fillGray,
                      buttonTextStyle:
                          CustomTextStyles.labelLargeDeeppurpleA400),
                  Spacer(),
                  SizedBox(height: 53.v),
                  CustomElevatedButton(
                      text: "lbl_save".tr,
                      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                      onPressed: () {
                        onTapSave();
                      })
                ]))));
  }

  /// Section Widget
  Widget _buildPageHeader() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_language".tr, style: theme.textTheme.headlineMedium),
          SizedBox(height: 7.v),
          Text("msg_your_settings_so".tr, style: theme.textTheme.labelLarge)
        ]));
  }

  /// Navigates to the previous screen.
  onTapBtnArrowLeft() {
    Get.back();
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapIndonesian() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapSave() {
    Get.toNamed(
      AppRoutes.signupScreen,
    );
  }
}
