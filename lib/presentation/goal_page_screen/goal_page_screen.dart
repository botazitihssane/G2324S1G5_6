import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_radio_button.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class GoalPageScreen extends StatelessWidget {
  GoalPageScreen({Key? key}) : super(key: key);

  TextEditingController weightLossController = TextEditingController();

  String radioGroup = "";

  List<String> radioList = ["msg_lean_muscle_gain", "msg_weight_maintenance"];

  TextEditingController bodyRecompositionController = TextEditingController();

  TextEditingController healthyWeightGainController = TextEditingController();

  TextEditingController checkBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 32.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("What is your goal ?",
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 7.v),
                      SizedBox(
                          width: 322.h,
                          child: Text(
                              "What are you looking to achieve, and how can we assist you on this empowering adventure?",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleSmall)),
                      SizedBox(height: 99.v),
                      _buildWeightLoss(context),
                      SizedBox(height: 18.v),
                      _buildGroup495(context),
                      SizedBox(height: 18.v),
                      _buildBodyRecomposition(context),
                      SizedBox(height: 18.v),
                      _buildHealthyWeightGain(context),
                      SizedBox(height: 20.v),
                      _buildCheckBox(context),
                      SizedBox(height: 86.v),
                      Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildBack(context),
                                _buildContinue(context)
                              ])),
                      SizedBox(height: 8.v)
                    ]))));
  }

  /// Section Widget
  Widget _buildWeightLoss(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 7.h),
        child: CustomTextFormField(
            controller: weightLossController, hintText: "Weight loss"));
  }

  /// Section Widget
  Widget _buildGroup495(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.h),
        child: Column(children: [
          CustomRadioButton(
              width: 312.h,
              text: "Lean muscle gain",
              value: radioList[0],
              groupValue: radioGroup,
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 16.v),
              textStyle: CustomTextStyles.bodySmallBlack90001,
              isRightCheck: true,
              onChange: (value) {
                radioGroup = value;
              }),
          Padding(
              padding: EdgeInsets.only(top: 18.v),
              child: CustomRadioButton(
                  width: 312.h,
                  text: "Weight maintenance",
                  value: radioList[1],
                  groupValue: radioGroup,
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.h, vertical: 16.v),
                  textStyle: CustomTextStyles.bodySmallBlack90001,
                  isRightCheck: true,
                  onChange: (value) {
                    radioGroup = value;
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildBodyRecomposition(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 7.h),
        child: CustomTextFormField(
            controller: bodyRecompositionController,
            hintText: "Body recomposition"));
  }

  /// Section Widget
  Widget _buildHealthyWeightGain(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 7.h),
        child: CustomTextFormField(
            controller: healthyWeightGainController,
            hintText: "Healthy weight gain",
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 14.v, 19.h, 14.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgContrastWhiteA700,
                    height: 21.v,
                    width: 22.h)),
            suffixConstraints: BoxConstraints(maxHeight: 49.v),
            contentPadding:
                EdgeInsets.only(left: 13.h, top: 16.v, bottom: 16.v)));
  }

  /// Section Widget
  Widget _buildCheckBox(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 7.h),
        child: CustomTextFormField(
            controller: checkBoxController,
            hintText: "Balanced fitness lifestyle",
            textInputAction: TextInputAction.done));
  }

  /// Section Widget
  Widget _buildBack(BuildContext context) {
    return CustomElevatedButton(
        width: 150.h,
        text: "Back",
        buttonStyle: CustomButtonStyles.fillGray,
        onPressed: () {
          backToWeight(context);
        });
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
        width: 150.h,
        text: "Continue",
        margin: EdgeInsets.only(left: 13.h),
        onPressed: () {
          navigateToActivity(context);
        });
  }

  /// Navigates to the weightPageScreen when the action is triggered.
  backToWeight(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.weightPageScreen);
  }

  /// Navigates to the physicalActivityScreen when the action is triggered.
  navigateToActivity(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.physicalActivityScreen);
  }
}
