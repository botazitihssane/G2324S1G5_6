import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_outlined_button.dart';

class PhysicalActivityScreen extends StatelessWidget {
  const PhysicalActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 65.v),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Your physical activity ?",
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 4.v),
                      SizedBox(
                          width: 322.h,
                          child: Text(
                              "Describe your current activity level. This helps us customize a fitness plan that suits your lifestyle and objectives.",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleSmall)),
                      Spacer(flex: 44),
                      _buildSedentaryButton(context),
                      SizedBox(height: 18.v),
                      _buildLightlyActiveButton(context),
                      SizedBox(height: 18.v),
                      _buildModeratelyActiveButton(context),
                      SizedBox(height: 18.v),
                      _buildVeryActiveButton(context),
                      Spacer(flex: 55),
                      SizedBox(height: 9.v),
                      Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildBackButton(context),
                                _buildContinueButton(context)
                              ]))
                    ]))));
  }

  /// Section Widget
  Widget _buildSedentaryButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "Sedentary", margin: EdgeInsets.only(left: 8.h, right: 7.h));
  }

  /// Section Widget
  Widget _buildLightlyActiveButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "Lightly active", margin: EdgeInsets.only(left: 8.h, right: 7.h));
  }

  /// Section Widget
  Widget _buildModeratelyActiveButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "Moderately active",
        margin: EdgeInsets.only(left: 8.h, right: 7.h),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        buttonTextStyle: CustomTextStyles.bodySmall12);
  }

  /// Section Widget
  Widget _buildVeryActiveButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "Very active", margin: EdgeInsets.only(left: 8.h, right: 7.h));
  }

  /// Section Widget
  Widget _buildBackButton(BuildContext context) {
    return CustomElevatedButton(
        width: 150.h,
        text: "Back",
        buttonStyle: CustomButtonStyles.fillGray,
        onPressed: () {
          onTapBackButton(context);
        });
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
        width: 150.h,
        text: "Continue",
        margin: EdgeInsets.only(left: 13.h),
        onPressed: () {
          onTapContinueButton(context);
        });
  }

  /// Navigates to the goalPageScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.goalPageScreen);
  }

  /// Navigates to the profilScreen when the action is triggered.
  onTapContinueButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profilScreen);
  }
}
