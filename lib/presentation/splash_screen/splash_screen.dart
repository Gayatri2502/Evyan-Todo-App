import 'package:flutter/material.dart';
import 'package:todo_app/core/app_export.dart';

import 'controller/adacana_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.loginOrSignupScreen);
      },
      child: Scaffold(
          body: SizedBox(
              width: double.maxFinite,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 1.v),

                    Image.asset("assets/images/mad.gif")
                    // CustomImageView(
                    //     imagePath: ImageConstant.imgLogo,
                    //     height: 325.v,
                    //     width: 238.h,
                    //     onTap: () {
                    //       onTapImgLogo();
                    //     })
                  ]))),
    ));
  }

  /// Navigates to the loginOrSignupScreen when the action is triggered.
  onTapImgLogo() {
    Get.toNamed(
      AppRoutes.loginOrSignupScreen,
    );
  }
}
