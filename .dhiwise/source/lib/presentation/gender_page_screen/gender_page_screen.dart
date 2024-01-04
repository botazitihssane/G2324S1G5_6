import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

class GenderPageScreen extends StatelessWidget {
  const GenderPageScreen({Key? key}) : super(key: key);

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
                      SizedBox(height: 81.v),
                      SizedBox(
                          height: 160.v,
                          width: 155.h,
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: 160.v,
                                    width: 155.h,
                                    decoration: BoxDecoration(
                                        color: appTheme.gray600,
                                        borderRadius:
                                            BorderRadius.circular(80.h)))),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 52.h),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgContrast,
                                              height: 51.adaptSize,
                                              width: 51.adaptSize),
                                          SizedBox(height: 19.v),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 7.h),
                                              child: Text("Male",
                                                  style: theme
                                                      .textTheme.titleSmall))
                                        ])))
                          ])),
                      SizedBox(height: 51.v),
                      SizedBox(
                          height: 160.v,
                          width: 155.h,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        height: 160.v,
                                        width: 155.h,
                                        decoration: BoxDecoration(
                                            color: theme.colorScheme.primary,
                                            borderRadius:
                                                BorderRadius.circular(80.h)))),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 52.h,
                                            right: 52.h,
                                            bottom: 30.v),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgLaptop,
                                                  height: 57.v,
                                                  width: 36.h),
                                              SizedBox(height: 9.v),
                                              Text("Female",
                                                  style: theme
                                                      .textTheme.titleSmall)
                                            ])))
                              ])),
                      Spacer(),
                      SizedBox(height: 6.v),
                      CustomElevatedButton(
                          text: "Continue",
                          margin: EdgeInsets.only(right: 13.h),
                          onPressed: () {
                            onTapContinue(context);
                          },
                          alignment: Alignment.centerLeft)
                    ]))));
  }

  /// Navigates to the agePageScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.agePageScreen);
  }
}
