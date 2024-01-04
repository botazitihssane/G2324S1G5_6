import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

class WeightPageScreen extends StatelessWidget {
  const WeightPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 69.v),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("What is your weight ?",
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 9.v),
                      Container(
                          width: 277.h,
                          margin: EdgeInsets.only(left: 24.h, right: 22.h),
                          child: Text(
                              "Share your weight, and we'll tailor your fitness plan for optimal results!",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleSmall)),
                      Spacer(flex: 47),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 16.v, bottom: 15.v),
                                    child: Text("58",
                                        style: CustomTextStyles
                                            .titleLargeRegular)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.v, bottom: 8.v),
                                    child: Text("59",
                                        style: CustomTextStyles
                                            .headlineLargeWhiteA700)),
                                Text("60",
                                    style:
                                        CustomTextStyles.displayMediumPrimary),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 9.v),
                                    child: Text("61",
                                        style: CustomTextStyles
                                            .headlineLargeWhiteA700)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 19.v, bottom: 12.v),
                                    child: Text("62",
                                        style:
                                            CustomTextStyles.titleLargeRegular))
                              ])),
                      SizedBox(height: 31.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowUp,
                          height: 13.v,
                          width: 25.h),
                      Spacer(flex: 52),
                      SizedBox(height: 6.v),
                      _buildEightyTwo(context)
                    ]))));
  }

  /// Section Widget
  Widget _buildEightyTwo(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: CustomElevatedButton(
                      text: "Back",
                      margin: EdgeInsets.only(right: 7.h, bottom: 1.v),
                      buttonStyle: CustomButtonStyles.fillGray,
                      onPressed: () {
                        backToHeight(context);
                      })),
              Expanded(
                  child: CustomElevatedButton(
                      text: "Continue",
                      margin: EdgeInsets.only(left: 7.h),
                      onPressed: () {
                        navigateToGoal(context);
                      }))
            ])));
  }

  /// Navigates to the heightPageScreen when the action is triggered.
  backToHeight(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.heightPageScreen);
  }

  /// Navigates to the goalPageScreen when the action is triggered.
  navigateToGoal(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.goalPageScreen);
  }
}
