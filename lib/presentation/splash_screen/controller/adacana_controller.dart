import 'package:todo_app/core/app_export.dart';

import '../models/adacana_model.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current SplashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> SplashModelObj = SplashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offNamed(
        AppRoutes.loginOrSignupScreen,
      );
    });
  }
}
