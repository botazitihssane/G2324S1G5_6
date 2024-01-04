import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

// ignore: must_be_immutable
class WorkoutcomponentItemWidget extends StatelessWidget {
  const WorkoutcomponentItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle2,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
            margin: EdgeInsets.only(
              top: 2.v,
              bottom: 3.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Abdominal Muscle Workout",
                  style: CustomTextStyles.titleSmallInter,
                ),
                SizedBox(height: 6.v),
                Row(
                  children: [
                    Text(
                      "Progress:",
                      style: CustomTextStyles.bodyMediumInterWhiteA700,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "8/20 exercises",
                        style: CustomTextStyles.bodyMediumInterWhiteA700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7.v),
                Row(
                  children: [
                    Text(
                      "Continue",
                      style: CustomTextStyles.labelLargeInterAmber400,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowRightAmber400,
                      height: 14.adaptSize,
                      width: 14.adaptSize,
                      margin: EdgeInsets.only(left: 2.h),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 50.adaptSize,
            width: 50.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 6.v),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50.adaptSize,
                    width: 50.adaptSize,
                    child: CircularProgressIndicator(
                      value: 0.5,
                      backgroundColor: appTheme.whiteA700.withOpacity(0.1),
                      color: appTheme.amber400,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "45%",
                    style: CustomTextStyles.labelLargeInter,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
