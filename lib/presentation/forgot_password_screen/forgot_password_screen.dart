import 'package:flutter/material.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/core/utils/validation_functions.dart';
import 'package:todo_app/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:todo_app/widgets/app_bar/appbar_title.dart';
import 'package:todo_app/widgets/app_bar/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_elevated_button.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';

import 'controller/forgot_password_controller.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: _buildAppBar(),
              body: Center(
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Form(
                          key: _formKey,
                          child: Container(
                              width: double.maxFinite,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 31.h, vertical: 22.v),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildPageHeader(),
                                    SizedBox(height: 36.v),
                                    CustomImageView(
                                        imagePath: ImageConstant
                                            .imgLogoGray5001121x135,
                                        height: 121.v,
                                        width: 135.h),
                                    SizedBox(height: 27.v),
                                    Text("lbl_forgot_password".tr,
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(height: 45.v),
                                    CustomTextFormField(
                                        controller: controller.emailController,
                                        hintText: "lbl_your_email".tr,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidEmail(value,
                                                  isRequired: true))) {
                                            return "err_msg_please_enter_valid_email"
                                                .tr;
                                          }
                                          return null;
                                        }),
                                    SizedBox(height: 19.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            width: 246.h,
                                            margin:
                                                EdgeInsets.only(right: 64.h),
                                            child: Text("Try another way ?".tr,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme
                                                    .textTheme.bodySmall!
                                                    .copyWith(height: 1.67)))),
                                    SizedBox(height: 4.v)
                                  ]))))),
              bottomNavigationBar: _buildStart())),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 32.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft();
            }),
        actions: [
          AppbarTitle(
              text: "lbl_forgot_password".tr,
              margin: EdgeInsets.symmetric(horizontal: 35.h, vertical: 14.v))
        ]);
  }

  /// Section Widget
  Widget _buildPageHeader() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          width: 262.h,
          margin: EdgeInsets.only(right: 48.h),
          child: Text("No worries! Reset your password effortlessly.".tr,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.displaySmall!.copyWith(height: 1.29))),
      Container(
          width: 245.h,
          margin: EdgeInsets.only(right: 65.h),
          child: Text(
              "Enter your email, and we'll guide you through the steps to regain control of your account. Your productivity journey awaits..."
                  .tr,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge!.copyWith(height: 1.67)))
    ]);
  }

  /// Section Widget
  Widget _buildStart() {
    return CustomElevatedButton(
        text: "lbl_start".tr,
        margin: EdgeInsets.only(left: 32.h, right: 32.h, bottom: 52.v),
        onPressed: () {
          onTapStart();
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapStart() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }
}
