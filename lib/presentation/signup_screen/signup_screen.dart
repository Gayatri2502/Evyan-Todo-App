import 'package:flutter/material.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/core/utils/validation_functions.dart';
import 'package:todo_app/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:todo_app/widgets/app_bar/appbar_title.dart';
import 'package:todo_app/widgets/app_bar/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_elevated_button.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';

import 'controller/signup_controller.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends GetWidget<SignupController> {
  SignupScreen({Key? key}) : super(key: key);

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
              backgroundColor: appTheme.gray5001,
              appBar: _buildAppBar(),
              body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 27.v),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 28.h, right: 32.h, bottom: 5.v),
                          child: Column(children: [
                            _buildPageHeader(),
                            SizedBox(height: 12.v),
                            CustomImageView(
                                imagePath: ImageConstant.imgLogoGray5001120x114,
                                height: 120.v,
                                width: 114.h),
                            SizedBox(height: 46.v),
                            _buildFirstName(),
                            SizedBox(height: 24.v),
                            _buildLastName(),
                            SizedBox(height: 24.v),
                            _buildEmail(),
                            SizedBox(height: 24.v),
                            _buildPassword(),
                            SizedBox(height: 22.v),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    width: 248.h,
                                    margin: EdgeInsets.only(right: 65.h),
                                    child: Text(
                                        "I accept Your Terms & Conditions.".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.labelLarge!
                                            .copyWith(height: 1.67)))),
                            SizedBox(height: 27.v),
                            _buildNext(),
                            SizedBox(height: 29.v),
                            GestureDetector(
                                onTap: () {
                                  onTapAlreadyHaveAn();
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("msg_already_have_an".tr,
                                          style: theme.textTheme.labelLarge),
                                      Padding(
                                          padding: EdgeInsets.only(left: 8.h),
                                          child: Text("lbl_login".tr,
                                              style: CustomTextStyles
                                                  .labelLargeSecondaryContainerSemiBold))
                                    ])),
                            SizedBox(height: 46.v),
                          ])))))),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 52.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 28.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft();
            }),
        actions: [
          AppbarTitle(
              text: "lbl_sign_up".tr,
              margin: EdgeInsets.symmetric(horizontal: 45.h, vertical: 14.v))
        ]);
  }

  /// Section Widget
  Widget _buildPageHeader() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
          width: 218.h,
          child: Text("Sign Up Today and Transform Your Tasks !!!...".tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.displaySmall!.copyWith(height: 1.18))),
      Container(
          width: 245.h,
          margin: EdgeInsets.only(right: 69.h),
          child: Text("msg_our_community_is2".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodySmallBlack900.copyWith(height: 1.67)))
    ]);
  }

  /// Section Widget
  Widget _buildFirstName() {
    return CustomTextFormField(
        controller: controller.firstNameController,
        hintText: "lbl_first_name".tr,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildLastName() {
    return CustomTextFormField(
        controller: controller.lastNameController,
        hintText: "lbl_last_name".tr,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
        controller: controller.emailController,
        hintText: "lbl_e_mail".tr,
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildPassword() {
    return CustomTextFormField(
        controller: controller.passwordController,
        hintText: "lbl_password".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
        obscureText: true);
  }

  /// Section Widget
  Widget _buildNext() {
    return CustomElevatedButton(
      text: "lbl_next".tr,
      onPressed: () {
        Get.toNamed(AppRoutes.homeScreen);
      },
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapAlreadyHaveAn() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
