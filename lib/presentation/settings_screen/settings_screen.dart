import 'package:flutter/material.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/widgets/custom_icon_button.dart';
import 'package:todo_app/widgets/custom_outlined_button.dart';

import 'controller/settings_controller.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 43.v),
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
                  SizedBox(height: 90.v),
                  _buildSettingOption(),
                  SizedBox(height: 34.v),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.personalityScreen);
                      },
                      child: _buildLanguage(language: "lbl_personality".tr)),
                  SizedBox(height: 14.v),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.languageScreen);
                      },
                      child: _buildLanguage(language: "lbl_language".tr)),
                  SizedBox(height: 14.v),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.termsandconditionsScreen);
                      },
                      child: _buildLanguage(
                          language: "msg_terms_and_conditions".tr)),
                  Spacer(),
                  SizedBox(height: 63.v),
                  CustomOutlinedButton(
                    text: "lbl_log_out".tr,
                  )
                ]))));
  }

  /// Section Widget
  Widget _buildSettingOption() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_settings".tr, style: theme.textTheme.headlineMedium),
      SizedBox(height: 9.v),
      Text("msg_your_settings_so".tr, style: theme.textTheme.labelLarge)
    ]);
  }

  /// Common widget
  Widget _buildLanguage({required String language}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 19.v),
        decoration: AppDecoration.outlineBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder14),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
              padding: EdgeInsets.only(top: 2.v),
              child: Text(language,
                  style: CustomTextStyles.labelLargeOnPrimary.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.6)))),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 6.v,
              width: 3.h,
              margin: EdgeInsets.only(left: 93.h, top: 7.v, bottom: 7.v))
        ]));
  }

  /// Navigates to the previous screen.
  onTapBtnArrowLeft() {
    Get.back();
  }
}
