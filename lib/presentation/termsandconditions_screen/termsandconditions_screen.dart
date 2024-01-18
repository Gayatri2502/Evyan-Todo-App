import 'package:flutter/material.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/widgets/custom_icon_button.dart';

import 'controller/termsandconditions_controller.dart';

class TermsandconditionsScreen extends GetWidget<TermsandconditionsController> {
  const TermsandconditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 43.v),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    padding: EdgeInsets.all(6.h),
                    onTap: () {
                      onTapBtnArrowLeft();
                    },
                    child:
                        CustomImageView(imagePath: ImageConstant.imgArrowLeft)),
                SizedBox(height: 79.v),
                SizedBox(
                    width: 155.h,
                    child: Text("msg_terms_and_conditions".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headlineMedium!
                            .copyWith(height: 1.36))),
                SizedBox(height: 63.v),
                Container(
                    width: 285.h,
                    margin: EdgeInsets.only(right: 25.h),
                    child: Text(
                        '''---
              Welcome to Evyan To-do App !
              
              These terms and conditions outline the rules and regulations for the use of Evyan To-do-App's Todo Application.
              
              By accessing this application, we assume you accept these terms and conditions. Do not continue to use Evyan To-do App  if you do not agree to all of the terms and conditions stated on this page.
              
               1. User Content
              
              By using our application, you agree to provide accurate, complete, and current information when creating tasks or interacting with the application. You are solely responsible for the content you submit, and any consequences that may arise from your actions.
              
               2. Privacy Policy
              
              Your use of Evyan To-do App  is also governed by our Privacy Policy. Please review our Privacy Policy, which outlines how we collect, use, and protect your personal information.
              
               3. Account Security
              
              You are responsible for maintaining the confidentiality of your account and password. You agree to notify us immediately of any unauthorized access or use of your account.
              
               4. Prohibited Activities
              
              You must not use Evyan To-do App  for any unlawful or prohibited activities. This includes, but is not limited to, violating any applicable local or international laws, infringing upon the rights of others, or engaging in any harmful or malicious activities.
              
               5. Termination
              
              We reserve the right to terminate or suspend your account and access to Evyan To-do App  at our sole discretion, without prior notice or liability, for any reason, including, but not limited to, breach of these terms.
              
               6. Modifications to Terms
              
              We may revise these terms and conditions at any time without prior notice. By using Evyan To-do App , you agree to be bound by the current version of these terms and conditions.
              
               7. Contact Information
              
              If you have any questions or concerns about our terms and conditions.
              
              ---
              
                            '''
                            .tr,
                        maxLines: 100,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodySmallOnPrimary_1
                            .copyWith(height: 2.00))),
                SizedBox(height: 2.v)
              ])),
    )));
  }

  /// Navigates to the previous screen.
  onTapBtnArrowLeft() {
    Get.back();
  }
}
