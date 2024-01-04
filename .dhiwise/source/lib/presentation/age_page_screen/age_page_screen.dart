import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

class AgePageScreen extends StatelessWidget {
  const AgePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 70.v),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("How old are you ?",
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 11.v),
                      Container(
                          width: 304.h,
                          margin: EdgeInsets.only(left: 9.h, right: 4.h),
                          child: Text(
                              " Tell us your age, and together, we'll create a customized plan designed just for you!",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleSmall)),
                      Spacer(flex: 44),
                      Text("33",
                          style: CustomTextStyles.bodyMediumInikaGray600),
                      SizedBox(height: 18.v),
                      Text("32", style: CustomTextStyles.titleLargeRegular),
                      SizedBox(height: 10.v),
                      Text("31",
                          style: CustomTextStyles.headlineLargeWhiteA700),
                      SizedBox(height: 5.v),
                      SizedBox(
                          width: 51.h,
                          child: Divider(color: theme.colorScheme.primary)),
                      SizedBox(height: 3.v),
                      Text("30", style: CustomTextStyles.displayMediumPrimary),
                      SizedBox(height: 8.v),
                      SizedBox(
                          width: 51.h,
                          child: Divider(color: theme.colorScheme.primary)),
                      Text("29",
                          style: CustomTextStyles.headlineLargeWhiteA700),
                      SizedBox(height: 9.v),
                      Text("28", style: CustomTextStyles.titleLargeRegular),
                      SizedBox(height: 16.v),
                      Text("27",
                          style: CustomTextStyles.bodyMediumInikaGray600),
                      Spacer(flex: 55),
                      SizedBox(height: 6.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomElevatedButton(
                                    width: 150.h,
                                    text: "Back",
                                    buttonStyle: CustomButtonStyles.fillGray,
                                    onPressed: () {
                                      onTapBack(context);
                                    }),
                                CustomElevatedButton(
                                    width: 150.h,
                                    text: "Continue",
                                    margin: EdgeInsets.only(left: 9.h),
                                    onPressed: () {
                                      onTapContinue(context);
                                    })
                              ]))
                    ]))));
  }

  /// Navigates to the genderPageScreen when the action is triggered.
  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.genderPageScreen);
  }

  /// Navigates to the heightPageScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.heightPageScreen);
  }
}
