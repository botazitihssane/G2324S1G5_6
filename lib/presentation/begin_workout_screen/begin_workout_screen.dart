import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_icon_button.dart';

class BeginWorkoutScreen extends StatelessWidget {
  const BeginWorkoutScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90002,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 27.v),
              Text(
                "Full-Body Workout",
                style: CustomTextStyles.headlineSmallDMSans,
              ),
              SizedBox(height: 17.v),
              CustomImageView(
                imagePath: ImageConstant.imgImage35,
                height: 160.adaptSize,
                width: 160.adaptSize,
                radius: BorderRadius.circular(
                  80.h,
                ),
              ),
              SizedBox(height: 31.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                    height: 32.v,
                    width: 60.h,
                    text: "Easy",
                    buttonStyle: CustomButtonStyles.fillPrimary1,
                    buttonTextStyle: CustomTextStyles.titleSmallDMSansBlack900,
                  ),
                  CustomElevatedButton(
                    height: 32.v,
                    width: 67.h,
                    text: "4 min",
                    margin: EdgeInsets.only(left: 34.h),
                    buttonStyle: CustomButtonStyles.fillPrimary1,
                    buttonTextStyle: CustomTextStyles.titleSmallDMSansBlack900,
                  ),
                ],
              ),
              SizedBox(height: 58.v),
              Text(
                "Shift stubborn body fat and build muscle",
                style: CustomTextStyles.titleMediumDMSansPrimary,
              ),
              SizedBox(height: 9.v),
              SizedBox(
                height: 459.v,
                width: 392.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgContent,
                      height: 429.v,
                      width: 392.h,
                      alignment: Alignment.bottomCenter,
                    ),
                    CustomIconButton(
                      height: 68.v,
                      width: 69.h,
                      padding: EdgeInsets.all(22.h),
                      decoration: IconButtonStyleHelper.outlinePink,
                      alignment: Alignment.topCenter,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgIconWhiteA700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
