import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class StartWorkoutBackScreen extends StatelessWidget {
  StartWorkoutBackScreen({Key? key}) : super(key: key);

  TextEditingController timeController = TextEditingController();

  TextEditingController calCounterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(
                          height: 859.v,
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                _buildArrowLeftStack(context),
                                _buildTimeColumn(context),
                                _buildButtonColumn(context)
                              ])),
                      SizedBox(height: 427.v),
                      Text("Hello Mohamed",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displayMedium)
                    ])))));
  }

  /// Section Widget
  Widget _buildArrowLeftStack(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
            height: 334.v,
            width: double.maxFinite,
            child: Stack(alignment: Alignment.topLeft, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgImage72,
                  height: 334.v,
                  width: 393.h,
                  alignment: Alignment.center),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 7.h, top: 14.v),
                  onTap: () {
                    onTapImgArrowLeft(context);
                  })
            ])));
  }

  /// Section Widget
  Widget _buildTimeColumn(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            margin: EdgeInsets.only(bottom: 7.v),
            padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 35.v),
            decoration: AppDecoration.fillOnPrimary
                .copyWith(borderRadius: BorderRadiusStyle.customBorderTL32),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      height: 277.v,
                      width: 307.h,
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 87.v),
                                child: Row(children: [
                                  CustomTextFormField(
                                      width: 86.h,
                                      controller: timeController,
                                      hintText: "60 min",
                                      prefix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              5.h, 5.v, 6.h, 5.v),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgOverflowmenu,
                                              height: 19.adaptSize,
                                              width: 19.adaptSize)),
                                      prefixConstraints:
                                          BoxConstraints(maxHeight: 29.v),
                                      contentPadding: EdgeInsets.only(
                                          top: 5.v, right: 14.h, bottom: 5.v),
                                      borderDecoration: TextFormFieldStyleHelper
                                          .fillPrimaryContainer,
                                      fillColor:
                                          theme.colorScheme.primaryContainer),
                                  Padding(
                                      padding: EdgeInsets.only(left: 17.h),
                                      child: CustomTextFormField(
                                          width: 89.h,
                                          controller: calCounterController,
                                          hintText: "600 Cal",
                                          textInputAction: TextInputAction.done,
                                          prefix: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  5.h, 5.v, 6.h, 5.v),
                                              child: CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgFireWhiteA700,
                                                  height: 19.adaptSize,
                                                  width: 19.adaptSize)),
                                          prefixConstraints:
                                              BoxConstraints(maxHeight: 29.v),
                                          contentPadding: EdgeInsets.only(
                                              top: 5.v,
                                              right: 14.h,
                                              bottom: 5.v),
                                          borderDecoration:
                                              TextFormFieldStyleHelper
                                                  .fillPrimaryContainer,
                                          fillColor: theme
                                              .colorScheme.primaryContainer))
                                ]))),
                        Align(
                            alignment: Alignment.center,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BACK WORKOUT",
                                      style:
                                          CustomTextStyles.titleLargeOpenSans),
                                  SizedBox(height: 8.v),
                                  Text("04 Workouts for Beginner",
                                      style: theme.textTheme.bodyMedium),
                                  SizedBox(height: 95.v),
                                  SizedBox(
                                      width: 307.h,
                                      child: Text(
                                          "Want your body to be healthy. Join our program with directions according to body’s goals. Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week. ",
                                          maxLines: 6,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodyMediumWhiteA70015
                                              .copyWith(height: 1.40)))
                                ]))
                      ]))),
              SizedBox(height: 11.v),
              Padding(
                  padding: EdgeInsets.only(right: 1.h),
                  child: _buildSmallCardRow(context)),
              SizedBox(height: 16.v),
              Padding(
                  padding: EdgeInsets.only(right: 1.h),
                  child: _buildSmallCardRow(context)),
              SizedBox(height: 56.v)
            ])));
  }

  /// Section Widget
  Widget _buildButtonColumn(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 46.h, vertical: 23.v),
            decoration:
                AppDecoration.gradientOnErrorContainerToOnErrorContainer1,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 98.v),
                  CustomElevatedButton(
                      height: 52.v,
                      text: "Start Workout",
                      margin: EdgeInsets.only(right: 15.h),
                      buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                      buttonTextStyle:
                          CustomTextStyles.titleMediumOpenSansBlack90001)
                ])));
  }

  /// Common widget
  Widget _buildSmallCardRow(BuildContext context) {
    return Container(
        decoration: AppDecoration.fillPrimaryContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgImage4,
              height: 76.v,
              width: 82.h,
              radius: BorderRadius.horizontal(left: Radius.circular(12.h))),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 9.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 122.h,
                        child: Text("Stability Training Basics",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.titleSmallOpenSans
                                .copyWith(height: 1.20))),
                    SizedBox(height: 2.v),
                    Text("0:30", style: theme.textTheme.bodyMedium)
                  ])),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgArrowDown,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(top: 26.v, right: 16.h, bottom: 26.v))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
