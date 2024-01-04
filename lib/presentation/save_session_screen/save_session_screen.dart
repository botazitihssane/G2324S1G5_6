import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_icon_button.dart';

class SaveSessionScreen extends StatelessWidget {
  const SaveSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildTopNavigation(context),
                  SizedBox(height: 80.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(right: 25.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 103.h),
                                        child: Text("Great Job!",
                                            style: theme
                                                .textTheme.headlineMedium)),
                                    Padding(
                                        padding: EdgeInsets.only(right: 34.h),
                                        child: Text(
                                            "You’ve completed your 34th workout",
                                            style: CustomTextStyles
                                                .bodyLargeNewYork)),
                                    SizedBox(height: 49.v),
                                    _buildSummary(context),
                                    SizedBox(height: 31.v),
                                    _buildSummary1(context),
                                    SizedBox(height: 126.v),
                                    CustomElevatedButton(
                                        text: "Save Session",
                                        margin: EdgeInsets.only(left: 24.h),
                                        buttonStyle:
                                            CustomButtonStyles.fillPrimaryTL14,
                                        buttonTextStyle: CustomTextStyles
                                            .titleMediumSFProTextBlack90001),
                                    SizedBox(height: 491.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Hello Mohamed",
                                            textAlign: TextAlign.center,
                                            style:
                                                theme.textTheme.displayMedium))
                                  ]))))
                ]))));
  }

  /// Section Widget
  Widget _buildTopNavigation(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 14.v),
        decoration: AppDecoration.outlineGrayB,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 7.v),
              CustomAppBar(
                  height: 24.v,
                  leadingWidth: 25.h,
                  leading: AppbarLeadingImage(
                      imagePath: ImageConstant.imgArrowLeftWhiteA70024x18,
                      margin: EdgeInsets.only(left: 7.h),
                      onTap: () {
                        onTapArrowLeft(context);
                      }),
                  title: AppbarSubtitleFour(
                      text: "Back", margin: EdgeInsets.only(left: 5.h)),
                  actions: [
                    AppbarSubtitleThree(
                        text: "Delete Session",
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 1.v))
                  ]),
              SizedBox(height: 11.v),
              Padding(
                  padding: EdgeInsets.only(left: 39.h),
                  child:
                      Text("Save Session", style: theme.textTheme.displaySmall))
            ]));
  }

  /// Section Widget
  Widget _buildSummary(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Summary",
                        style: CustomTextStyles.titleMediumSFProText),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Compare to: ",
                              style: theme.textTheme.bodyLarge),
                          TextSpan(
                              text: "Previous ",
                              style: CustomTextStyles.bodyLargeIndigo400),
                          TextSpan(
                              text: "􀆈 ",
                              style: CustomTextStyles.bodyLargeIndigo400)
                        ]),
                        textAlign: TextAlign.left)
                  ])),
          SizedBox(height: 14.v),
          Padding(
              padding: EdgeInsets.only(left: 50.h, right: 29.h),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Column(children: [
                  SizedBox(
                      height: 58.adaptSize,
                      width: 58.adaptSize,
                      child: Stack(alignment: Alignment.center, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgUiIconsFlameFill,
                            height: 29.adaptSize,
                            width: 29.adaptSize,
                            alignment: Alignment.center),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 58.adaptSize,
                                width: 58.adaptSize,
                                decoration: BoxDecoration(
                                    color:
                                        appTheme.deepOrange500.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(29.h))))
                      ])),
                  SizedBox(height: 10.v),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "688 ",
                            style: CustomTextStyles
                                .titleMediumSFProTextDeeporange500SemiBold),
                        TextSpan(
                            text: "kcal",
                            style:
                                CustomTextStyles.titleMediumSFProTextSemiBold)
                      ]),
                      textAlign: TextAlign.left),
                  Text("Burned", style: theme.textTheme.bodyLarge)
                ]),
                Spacer(flex: 47),
                Column(children: [
                  CustomIconButton(
                      height: 58.adaptSize,
                      width: 58.adaptSize,
                      padding: EdgeInsets.all(11.h),
                      decoration: IconButtonStyleHelper.fillLightBlue,
                      child: CustomImageView(imagePath: ImageConstant.imgIcon)),
                  SizedBox(height: 11.v),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "1606",
                            style: CustomTextStyles
                                .titleMediumSFProTextLightblue200),
                        TextSpan(text: " "),
                        TextSpan(
                            text: "kg",
                            style:
                                CustomTextStyles.titleMediumSFProTextSemiBold)
                      ]),
                      textAlign: TextAlign.left),
                  Text("Lifted", style: theme.textTheme.bodyLarge)
                ]),
                Spacer(flex: 52),
                _buildTime(context, timeText: "45 min", trainedText: "Trained")
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildSummary1(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Personal Records",
              style: CustomTextStyles.titleMediumSFProText),
          SizedBox(height: 15.v),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 63.h),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(children: [
                      CustomIconButton(
                          height: 58.adaptSize,
                          width: 58.adaptSize,
                          padding: EdgeInsets.all(11.h),
                          decoration: IconButtonStyleHelper.fillDeepOrange,
                          child: CustomImageView(
                              imagePath: ImageConstant.imgTicket)),
                      SizedBox(height: 10.v),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "688 ",
                                style: CustomTextStyles
                                    .titleMediumSFProTextDeeporange500SemiBold),
                            TextSpan(
                                text: "kcal",
                                style: CustomTextStyles
                                    .titleMediumSFProTextSemiBold)
                          ]),
                          textAlign: TextAlign.left),
                      Text("Burned", style: theme.textTheme.bodyLarge)
                    ]),
                    Padding(
                        padding: EdgeInsets.only(left: 47.h),
                        child: _buildTime(context,
                            timeText: "45 min", trainedText: "Trained"))
                  ])))
        ]));
  }

  /// Common widget
  Widget _buildTime(
    BuildContext context, {
    required String timeText,
    required String trainedText,
  }) {
    return Column(children: [
      CustomIconButton(
          height: 58.adaptSize,
          width: 58.adaptSize,
          padding: EdgeInsets.all(11.h),
          child: CustomImageView(imagePath: ImageConstant.imgClock)),
      SizedBox(height: 10.v),
      Text(timeText,
          style: CustomTextStyles.titleMediumSFProTextSemiBold_1
              .copyWith(color: appTheme.whiteA700)),
      SizedBox(height: 1.v),
      Text(trainedText,
          style: theme.textTheme.bodyLarge!.copyWith(color: appTheme.whiteA700))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
