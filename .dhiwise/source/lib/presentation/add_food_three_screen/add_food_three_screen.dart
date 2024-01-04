import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

class AddFoodThreeScreen extends StatelessWidget {
  const AddFoodThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 33.v),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 11.v),
                      decoration: AppDecoration.fillGray80093.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        _buildArrowLeftRow(context),
                        SizedBox(height: 32.v),
                        _buildComponentNineColumn(context),
                        SizedBox(height: 11.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 34.h),
                                child: Text("1 g",
                                    style: CustomTextStyles
                                        .bodyMediumInikaWhiteA700))),
                        SizedBox(height: 7.v),
                        _buildServingSizeColumn(context),
                        _buildServingSizeColumn1(context)
                      ]))
                ]))));
  }

  /// Section Widget
  Widget _buildArrowLeftRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 23.h, right: 20.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeftWhiteA70013x13,
                  height: 13.adaptSize,
                  width: 13.adaptSize,
                  margin: EdgeInsets.only(top: 9.v, bottom: 5.v),
                  onTap: () {
                    onTapImgArrowLeft(context);
                  }),
              Text("Add food", style: CustomTextStyles.titleLargePrimary_1),
              CustomImageView(
                  imagePath: ImageConstant.imgCheckmark,
                  height: 9.v,
                  width: 13.h,
                  margin: EdgeInsets.only(top: 13.v, bottom: 4.v))
            ]));
  }

  /// Section Widget
  Widget _buildComponentNineColumn(BuildContext context) {
    return Column(children: [
      Container(
          decoration: AppDecoration.fillGray800931,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Divider(),
            SizedBox(height: 9.v),
            Padding(
                padding: EdgeInsets.only(left: 25.h),
                child: Text("Poulet (Blanc De)",
                    style: theme.textTheme.labelLarge)),
            SizedBox(height: 9.v),
            Padding(
                padding: EdgeInsets.only(left: 25.h),
                child: Text("Poulet", style: theme.textTheme.bodySmall))
          ])),
      Divider()
    ]);
  }

  /// Section Widget
  Widget _buildServingSizeColumn(BuildContext context) {
    return Container(
        decoration: AppDecoration.fillGray800931,
        child: Column(children: [
          _buildLineFifteen(context),
          SizedBox(height: 7.v),
          Padding(
              padding: EdgeInsets.only(left: 25.h, right: 14.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 6.v, bottom: 4.v),
                        child: Text("Number of servings",
                            style: theme.textTheme.bodySmall)),
                    Container(
                        width: 60.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 21.h, vertical: 1.v),
                        decoration: AppDecoration.outlineBluegray1001.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder2),
                        child: Text("80",
                            style: CustomTextStyles.bodyMediumInikaWhiteA700))
                  ])),
          SizedBox(height: 7.v)
        ]));
  }

  /// Section Widget
  Widget _buildServingSizeColumn1(BuildContext context) {
    return Container(
        decoration: AppDecoration.fillGray800931,
        child: Column(children: [
          _buildLineFifteen(context),
          SizedBox(height: 7.v),
          Padding(
              padding: EdgeInsets.only(left: 25.h, right: 14.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.v),
                        child: Text("Meal", style: theme.textTheme.bodySmall)),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.h, vertical: 2.v),
                        decoration: AppDecoration.outlineIndigoA40001.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder2),
                        child: SizedBox(
                            child: Divider(color: appTheme.indigoA40001)))
                  ])),
          SizedBox(height: 7.v)
        ]));
  }

  /// Common widget
  Widget _buildLineFifteen(BuildContext context) {
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
