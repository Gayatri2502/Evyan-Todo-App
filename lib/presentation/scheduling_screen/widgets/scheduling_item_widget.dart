import 'package:flutter/material.dart';
import 'package:todo_app/core/app_export.dart';

import '../../../theme/app_style.dart';
import '../controller/scheduling_controller.dart';
import '../models/scheduling_item_model.dart';

// ignore: must_be_immutable
class SchedulingItemWidget extends StatelessWidget {
  SchedulingItemWidget(this.schedulingItemModelObj);

  SchedulingItemModel schedulingItemModelObj;

  var controller = Get.find<SchedulingController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 12,
          top: 16,
          right: 12,
          bottom: 16,
        ),
        decoration: AppDecoration.fillBlueA700.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder6,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                left: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 2,
                      bottom: 1,
                    ),
                    child: Obx(
                      () => Text(
                        schedulingItemModelObj.mathematicsTxt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtGilroySemiBold16WhiteA700,
                      ),
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgOverflowmenu,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 8,
                top: 7,
              ),
              child: Obx(
                () => Text(
                  schedulingItemModelObj.chapter1IntroductionTxt.value,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtGilroyMedium12,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 8,
                top: 15,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgLocation,
                    height: getSize(
                      16,
                    ),
                    width: getSize(
                      16,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 16,
                    ),
                    child: Obx(
                      () => Text(
                        schedulingItemModelObj.room6205Txt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtGilroyMedium12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 8,
                top: 8,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse316x16,
                    height: getSize(
                      16,
                    ),
                    width: getSize(
                      16,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        8,
                      ),
                    ),
                    margin: getMargin(
                      bottom: 1,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 16,
                    ),
                    child: Obx(
                      () => Text(
                        schedulingItemModelObj.schoolnameTxt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
