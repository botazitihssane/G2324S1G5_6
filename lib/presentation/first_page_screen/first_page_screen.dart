import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

class FirstPageScreen extends StatelessWidget {
  const FirstPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 35.h,
              vertical: 77.v,
            ),
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder15,
              image: DecorationImage(
                image: AssetImage(
                  ImageConstant.imgIphone1415Pro,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 257.h,
                    margin: EdgeInsets.only(right: 63.h),
                    child: Text(
                      "Begin your Journey",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.displayMediumBold,
                    ),
                  ),
                ),
                Spacer(),
                CustomElevatedButton(
                  text: "Sign up",
                  margin: EdgeInsets.only(
                    left: 31.h,
                    right: 40.h,
                  ),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                  buttonTextStyle: CustomTextStyles.titleLarge22,
                ),
                SizedBox(height: 19.v),
                CustomElevatedButton(
                  text: "Sign in",
                  margin: EdgeInsets.only(
                    left: 31.h,
                    right: 40.h,
                  ),
                  buttonStyle: CustomButtonStyles.fillGrayTL10,
                  buttonTextStyle: CustomTextStyles.titleLarge22,
                ),
                SizedBox(height: 9.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
