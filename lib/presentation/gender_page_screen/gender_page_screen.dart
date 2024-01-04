import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_radio_button.dart';

// ignore_for_file: must_be_immutable
class GenderPageScreen extends StatelessWidget {
  GenderPageScreen({Key? key}) : super(key: key);

  String radioGroup = "";

  String radioGroup1 = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 70.v),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tell us about yourself",
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 12.v),
                      Container(
                          width: 315.h,
                          margin: EdgeInsets.only(left: 8.h),
                          child: Text(
                              "Fuel your fitness journey with customization! Select your gender to tailor your experience.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleSmall)),
                      SizedBox(height: 181.v),
                      _buildGenderRadio1(context),
                      SizedBox(height: 70.v),
                      _buildGenderRadio2(context),
                      Spacer(),
                      SizedBox(height: 6.v),
                      CustomElevatedButton(
                          text: "Continue",
                          margin: EdgeInsets.only(right: 13.h),
                          onPressed: () {
                            navigateToAge(context);
                          },
                          alignment: Alignment.centerLeft)
                    ]))));
  }

  /// Section Widget
  Widget _buildGenderRadio1(BuildContext context) {
    return CustomRadioButton(
        width: 155.h,
        text: "Male",
        value: "Male",
        groupValue: radioGroup,
        decoration: RadioStyleHelper.fillGray600,
        isRightCheck: true,
        onChange: (value) {
          radioGroup = value;
        });
  }

  /// Section Widget
  Widget _buildGenderRadio2(BuildContext context) {
    return CustomRadioButton(
        width: 155.h,
        text: "Female",
        value: "Female",
        groupValue: radioGroup1,
        decoration: RadioStyleHelper.fillPrimary,
        isRightCheck: true,
        onChange: (value) {
          radioGroup1 = value;
        });
  }

  /// Navigates to the agePageScreen when the action is triggered.
  navigateToAge(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.agePageScreen);
  }
}
