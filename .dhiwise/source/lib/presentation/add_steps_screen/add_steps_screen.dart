import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

class AddStepsScreen extends StatelessWidget {
  const AddStepsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray900,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 33.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 27.h,
                  vertical: 11.v,
                ),
                decoration: AppDecoration.fillGray80093.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCancelRow(context),
                    SizedBox(height: 31.v),
                    _buildDateColumn(context),
                    SizedBox(height: 31.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCancelRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "Cancel",
              style: theme.textTheme.titleLarge,
            ),
          ),
          Spacer(
            flex: 44,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              "Steps",
              style: CustomTextStyles.titleLargePrimary_1,
            ),
          ),
          Spacer(
            flex: 55,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "Add",
              style: CustomTextStyles.titleLargeIndigoA40001,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDateColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.h),
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillGray600.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              right: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Text(
                    "Date",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                Container(
                  width: 90.h,
                  margin: EdgeInsets.only(bottom: 2.v),
                  padding: EdgeInsets.symmetric(horizontal: 17.h),
                  decoration: AppDecoration.fillBluegray100.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "03/12/2023",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            color: appTheme.gray600.withOpacity(0.28),
          ),
          SizedBox(height: 6.v),
          SizedBox(
            height: 23.v,
            width: 325.h,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14.h),
                        child: Text(
                          "Time",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(height: 5.v),
                      Divider(
                        color: appTheme.gray600.withOpacity(0.28),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 58.h,
                    margin: EdgeInsets.only(right: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    decoration: AppDecoration.fillBluegray100.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                    ),
                    child: Text(
                      "20:29",
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              right: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Steps",
                  style: theme.textTheme.labelLarge,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: SizedBox(
                    child: Divider(
                      color: appTheme.indigoA40001,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
