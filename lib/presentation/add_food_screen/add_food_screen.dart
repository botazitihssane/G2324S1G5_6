import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddFoodScreen extends StatelessWidget {
  AddFoodScreen({Key? key}) : super(key: key);

  TextEditingController weightController = TextEditingController();

  TextEditingController weightController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 33.v),
                  _buildHorizontalScroll(context)
                ]))));
  }

  /// Section Widget
  Widget _buildHorizontalScroll(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(
                  height: 819.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            height: 819.v,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: appTheme.gray80093.withOpacity(0.33),
                                borderRadius: BorderRadius.circular(10.h)))),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: EdgeInsets.only(top: 72.v),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      decoration: AppDecoration.fillGray800931,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Divider(),
                                            SizedBox(height: 9.v),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 25.h),
                                                child: Text("Poulet (Blanc De)",
                                                    style: theme
                                                        .textTheme.labelLarge)),
                                            SizedBox(height: 9.v),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 25.h),
                                                child: Text("Poulet",
                                                    style: theme
                                                        .textTheme.bodySmall))
                                          ])),
                                  Divider()
                                ]))),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: EdgeInsets.only(top: 122.v),
                            decoration: AppDecoration.fillGray800931,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildFoodSection(context),
                                  SizedBox(height: 7.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.h, right: 14.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 6.v, bottom: 4.v),
                                                child: Text("Serving size",
                                                    style: theme
                                                        .textTheme.bodySmall)),
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.h,
                                                    vertical: 2.v),
                                                decoration: AppDecoration
                                                    .outlineIndigoA40001
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder2),
                                                child: SizedBox(
                                                    child: Divider(
                                                        color: appTheme
                                                            .indigoA40001)))
                                          ])),
                                  SizedBox(height: 7.v)
                                ]))),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: EdgeInsets.only(top: 162.v),
                            decoration: AppDecoration.fillGray800931,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildFoodSection(context),
                                  SizedBox(height: 7.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.h, right: 14.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 6.v, bottom: 4.v),
                                                child: Text(
                                                    "Number of servings",
                                                    style: theme
                                                        .textTheme.bodySmall)),
                                            Container(
                                                height: 25.v,
                                                width: 60.h,
                                                decoration: BoxDecoration(
                                                    color: appTheme.gray80093,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.h),
                                                    border: Border.all(
                                                        color: appTheme
                                                            .blueGray100,
                                                        width: 2.h)))
                                          ])),
                                  SizedBox(height: 7.v)
                                ]))),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: EdgeInsets.only(top: 202.v),
                            decoration: AppDecoration.fillGray800931,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildFoodSection(context),
                                  SizedBox(height: 7.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.h, right: 14.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.v),
                                                child: Text("Meal",
                                                    style: theme
                                                        .textTheme.bodySmall)),
                                            Container(
                                                height: 25.v,
                                                width: 60.h,
                                                decoration: BoxDecoration(
                                                    color: appTheme.gray80093,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.h),
                                                    border: Border.all(
                                                        color: appTheme
                                                            .blueGray100,
                                                        width: 2.h)))
                                          ])),
                                  SizedBox(height: 7.v)
                                ]))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 19.v),
                            decoration: AppDecoration.fillGray.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderBL20),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 25.h),
                                          child: Text("Select unit",
                                              style:
                                                  theme.textTheme.labelLarge))),
                                  SizedBox(height: 13.v),
                                  Divider(color: appTheme.blueGray100),
                                  SizedBox(height: 10.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 11.h, right: 12.h),
                                      child: CustomTextFormField(
                                          controller: weightController,
                                          hintText: "100 g",
                                          hintStyle:
                                              CustomTextStyles.bodySmall12,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 30.h,
                                              vertical: 17.v))),
                                  SizedBox(height: 12.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 11.h, right: 12.h),
                                      child: CustomTextFormField(
                                          controller: weightController1,
                                          hintText: "1 g",
                                          hintStyle:
                                              CustomTextStyles.bodySmall12,
                                          textInputAction: TextInputAction.done,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 30.h,
                                              vertical: 17.v))),
                                  SizedBox(height: 7.v)
                                ]))),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            width: 349.h,
                            margin:
                                EdgeInsets.fromLTRB(23.h, 11.v, 20.h, 779.v),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant
                                          .imgArrowLeftWhiteA70013x13,
                                      height: 13.adaptSize,
                                      width: 13.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 9.v, bottom: 5.v),
                                      onTap: () {
                                        onTapImgArrowLeft(context);
                                      }),
                                  Text("Add food",
                                      style:
                                          CustomTextStyles.titleLargePrimary_1),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgCheckmark,
                                      height: 9.v,
                                      width: 13.h,
                                      margin: EdgeInsets.only(
                                          top: 13.v, bottom: 4.v))
                                ])))
                  ])),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 563.h, top: 122.v, bottom: 657.v),
                      decoration: AppDecoration.fillGray800931,
                      child: Column(children: [
                        _buildFoodSection(context),
                        SizedBox(height: 7.v),
                        Padding(
                            padding: EdgeInsets.only(left: 25.h, right: 14.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 6.v),
                                      child: Text("Serving size",
                                          style: theme.textTheme.bodySmall)),
                                  Container(
                                      height: 25.v,
                                      width: 60.h,
                                      margin: EdgeInsets.only(left: 7.h),
                                      decoration: BoxDecoration(
                                          color: appTheme.gray80093,
                                          borderRadius:
                                              BorderRadius.circular(2.h),
                                          border: Border.all(
                                              color: appTheme.blueGray100,
                                              width: 2.h)))
                                ])),
                        SizedBox(height: 7.v)
                      ])))
            ])));
  }

  /// Common widget
  Widget _buildFoodSection(BuildContext context) {
    return SizedBox(
        height: 1.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.center,
              child: SizedBox(width: double.maxFinite, child: Divider())),
          Align(
              alignment: Alignment.center,
              child: SizedBox(width: double.maxFinite, child: Divider()))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
