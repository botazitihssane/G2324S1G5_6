import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

class HeightPageScreen extends StatelessWidget {
  const HeightPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 66.v),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("What is you height ?",
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 12.v),
                      Container(
                          width: 268.h,
                          margin: EdgeInsets.only(left: 27.h, right: 28.h),
                          child: Text(
                              "Enter your height, and we'll customize your fitness plan to elevate your goals!",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleSmall)),
                      Spacer(flex: 43),
                      Text("163",
                          style: CustomTextStyles.bodyMediumInikaGray600),
                      SizedBox(height: 16.v),
                      Text("162", style: CustomTextStyles.titleLargeRegular),
                      SizedBox(height: 8.v),
                      Text("161",
                          style: CustomTextStyles.headlineLargeWhiteA700),
                      SizedBox(height: 9.v),
                      SizedBox(
                          height: 69.v,
                          width: 71.h,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("160",
                                              style: CustomTextStyles
                                                  .displayMediumPrimary),
                                          SizedBox(height: 7.v),
                                          SizedBox(
                                              width: 70.h,
                                              child: Divider(
                                                  color: theme
                                                      .colorScheme.primary))
                                        ]))),
                            Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                    width: 70.h,
                                    child: Divider(
                                        color: theme.colorScheme.primary)))
                          ])),
                      SizedBox(height: 8.v),
                      Text("159",
                          style: CustomTextStyles.headlineLargeWhiteA700),
                      SizedBox(height: 10.v),
                      Text("158", style: CustomTextStyles.titleLargeRegular),
                      SizedBox(height: 15.v),
                      Text("157",
                          style: CustomTextStyles.bodyMediumInikaGray600),
                      Spacer(flex: 56),
                      SizedBox(height: 8.v),
                      Padding(
                          padding: EdgeInsets.only(left: 11.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: CustomElevatedButton(
                                        text: "Back",
                                        margin: EdgeInsets.only(right: 7.h),
                                        buttonStyle:
                                            CustomButtonStyles.fillGray,
                                        onPressed: () {
                                          onTapBack(context);
                                        })),
                                Expanded(
                                    child: CustomElevatedButton(
                                        text: "Continue",
                                        margin: EdgeInsets.only(left: 7.h),
                                        onPressed: () {
                                          onTapContinue(context);
                                        }))
                              ]))
                    ]))));
  }

  /// Navigates to the agePageScreen when the action is triggered.
  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.agePageScreen);
  }

  /// Navigates to the weightPageScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.weightPageScreen);
  }
}
