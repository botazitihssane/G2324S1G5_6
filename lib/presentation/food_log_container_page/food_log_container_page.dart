import '../food_log_container_page/widgets/lunchtext_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class FoodLogContainerPage extends StatelessWidget {
  const FoodLogContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillBlueGray,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30.v),
            child: Column(
              children: [
                Text(
                  "Food log",
                  style: theme.textTheme.headlineLarge,
                ),
                SizedBox(height: 37.v),
                _buildCaloriesRemaining(context),
                Divider(),
                SizedBox(height: 29.v),
                _buildBreakfast1(context),
                _buildLunchText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCaloriesRemaining(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.v),
      decoration: AppDecoration.fillGray800931,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 6.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Text(
                "Calories Remaining",
                style: theme.textTheme.labelLarge,
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "1570",
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                    Text(
                      "Goal",
                      style: CustomTextStyles.bodySmall8,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.v),
                  child: Text(
                    "-",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                Column(
                  children: [
                    Opacity(
                      opacity: 0.79,
                      child: Text(
                        "279",
                        style: CustomTextStyles.labelLargeWhiteA700,
                      ),
                    ),
                    Text(
                      "Food",
                      style: CustomTextStyles.bodySmall8,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.v),
                  child: Text(
                    "+",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                SizedBox(
                  height: 26.v,
                  width: 31.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Exercise",
                          style: CustomTextStyles.bodySmall8,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "185",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.v),
                  child: Text(
                    "=",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 6.h),
                        child: Text(
                          "1476",
                          style: CustomTextStyles.labelLargeIndigoA40001,
                        ),
                      ),
                    ),
                    Text(
                      "Remaining",
                      style: CustomTextStyles.bodySmall8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBreakfast1(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.v),
      decoration: AppDecoration.fillGray800931,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.v),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              right: 20.h,
            ),
            child: _buildRizJaune(
              context,
              userImage: "Breakfast",
              textLabel: "279",
            ),
          ),
          SizedBox(height: 5.v),
          Divider(),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              right: 20.h,
            ),
            child: _buildRizJaune(
              context,
              userImage: "Riz jaune",
              textLabel: "279",
            ),
          ),
          SizedBox(height: 14.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 14.v,
              width: 42.h,
              margin: EdgeInsets.only(left: 14.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Add food",
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Add food",
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLunchText(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0.v),
          child: SizedBox(
            width: double.maxFinite,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.gray600,
            ),
          ),
        );
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return LunchtextItemWidget();
      },
    );
  }

  /// Common widget
  Widget _buildRizJaune(
    BuildContext context, {
    required String userImage,
    required String textLabel,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          userImage,
          style: theme.textTheme.bodySmall!.copyWith(
            color: appTheme.whiteA700,
          ),
        ),
        Text(
          textLabel,
          style: theme.textTheme.bodySmall!.copyWith(
            color: appTheme.whiteA700,
          ),
        ),
      ],
    );
  }
}
