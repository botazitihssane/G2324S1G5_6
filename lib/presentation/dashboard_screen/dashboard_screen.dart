import 'package:wotkout_app/presentation/sign_in_screen/auth.dart';

import '../dashboard_screen/widgets/recipelist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/presentation/food_log_page/food_log_page.dart';
import 'package:wotkout_app/widgets/custom_bottom_bar.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 30.v),
              _buildMyWorkoutRow(context),
              SizedBox(height: 21.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today",
                      style: CustomTextStyles.titleLarge20,
                    ),
                    Container(
                      width: 45.h,
                      margin: EdgeInsets.only(bottom: 5.v),
                      padding: EdgeInsets.symmetric(
                        horizontal: 11.h,
                        vertical: 1.v,
                      ),
                      decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "Edit",
                        style: CustomTextStyles.bodySmall12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.v),
              _buildSeventySevenColumn(context),
              SizedBox(height: 19.v),
              _buildStepsRow(context),
              SizedBox(height: 19.v),
              _buildVectorStack(context),
              SizedBox(height: 14.v),
              _buildSeventySixColumn(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildMyWorkoutRow(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 36.h),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 14.v,
                        bottom: 8.v,
                      ),
                      child: Text(
                        "MyWorkout",
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(width: 170.h),
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () async {
                        await _auth.signOut();
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.signInScreen);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 281.h,
                  top: 12.v,
                  bottom: 12.v,
                ),
                child: Text(
                  "MyWorkout",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventySevenColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 36.h,
        right: 41.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillGray800931.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Calories",
            style: theme.textTheme.titleSmall,
          ),
          Text(
            "Remaining = Goal - Food + Exercise",
            style: CustomTextStyles.labelMediumGray600,
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 22.h,
                right: 3.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.h,
                      vertical: 32.v,
                    ),
                    decoration: AppDecoration.outlineBluegray9001.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder56,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "1200",
                          style: CustomTextStyles.titleLarge20,
                        ),
                        Text(
                          "Remaining",
                          style: CustomTextStyles.labelMediumWhiteA700,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 13.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 80.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgSettingsGray300,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.symmetric(vertical: 4.v),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Base Goal",
                                    style: CustomTextStyles.bodySmall12,
                                  ),
                                  Text(
                                    "1200",
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSettingsPrimary,
                              height: 20.v,
                              width: 16.h,
                              margin: EdgeInsets.symmetric(vertical: 5.v),
                            ),
                            Container(
                              height: 31.v,
                              width: 27.h,
                              margin: EdgeInsets.only(left: 8.h),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "0",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "Food",
                                      style: CustomTextStyles.bodySmall12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.v),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgFire,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              margin: EdgeInsets.only(
                                top: 4.v,
                                bottom: 5.v,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Exercise",
                                    style: CustomTextStyles.bodySmall12,
                                  ),
                                  Text(
                                    "0",
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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
  Widget _buildStepsRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 36.h,
        right: 41.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.h,
              vertical: 7.v,
            ),
            decoration: AppDecoration.fillGray800931.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 124.h,
                    margin: EdgeInsets.only(left: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 16.v,
                          width: 30.h,
                          margin: EdgeInsets.only(top: 3.v),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Steps",
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Steps",
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "+",
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 6.v),
                Padding(
                  padding: EdgeInsets.only(left: 14.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgUser,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          bottom: 3.v,
                        ),
                        child: Text(
                          "732",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.v),
                Padding(
                  padding: EdgeInsets.only(left: 14.h),
                  child: Text(
                    "Goal : 10.000 steps",
                    style: CustomTextStyles.bodySmall8,
                  ),
                ),
                SizedBox(height: 5.v),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 5.v,
                    width: 111.h,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray900,
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                      child: LinearProgressIndicator(
                        value: 0.05,
                        backgroundColor: appTheme.blueGray900,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          appTheme.red900,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.v),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.h),
            padding: EdgeInsets.symmetric(
              horizontal: 9.h,
              vertical: 7.v,
            ),
            decoration: AppDecoration.fillGray800931.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 125.h,
                    margin: EdgeInsets.only(left: 7.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 2.v,
                            bottom: 1.v,
                          ),
                          child: Text(
                            "Exercise",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        Text(
                          "+",
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 6.v),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgFire,
                        height: 15.adaptSize,
                        width: 15.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: Text(
                          "7 cal",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.v),
                Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgUserIndigoA40001,
                        height: 15.adaptSize,
                        width: 15.adaptSize,
                        margin: EdgeInsets.only(top: 1.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          "00:00 hr",
                          style: CustomTextStyles.labelLargeGray600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.v),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDurationStack(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 181.v,
        width: 316.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 19.h,
                  right: 19.h,
                  bottom: 4.v,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Last 90 days",
                      style: CustomTextStyles.bodySmall8,
                    ),
                    SizedBox(height: 7.v),
                    Container(
                      height: 132.v,
                      width: 269.h,
                      margin: EdgeInsets.only(left: 7.h),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 19.h,
                                top: 115.v,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgGroupBlueGray100,
                                    height: 6.v,
                                    width: 1.h,
                                    margin: EdgeInsets.only(bottom: 11.v),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 5.h,
                                      top: 6.v,
                                    ),
                                    child: Text(
                                      "04/09",
                                      style:
                                          CustomTextStyles.bodySmallBluegray100,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 28,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 6.v),
                                    child: Text(
                                      "04/10",
                                      style:
                                          CustomTextStyles.bodySmallBluegray100,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 41,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 6.v),
                                    child: Text(
                                      "03/11",
                                      style:
                                          CustomTextStyles.bodySmallBluegray100,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 30,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 6.v),
                                    child: Text(
                                      "03/12",
                                      style:
                                          CustomTextStyles.bodySmallBluegray100,
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgGroupBlueGray100,
                                    height: 6.v,
                                    width: 1.h,
                                    margin: EdgeInsets.only(
                                      left: 6.h,
                                      bottom: 11.v,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Opacity(
                                        opacity: 0.8,
                                        child: Text(
                                          "80",
                                          style: CustomTextStyles
                                              .bodySmallBluegray1008,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15.v),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "75",
                                        style: CustomTextStyles
                                            .bodySmallBluegray100,
                                      ),
                                    ),
                                    SizedBox(height: 17.v),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "70",
                                        style: CustomTextStyles
                                            .bodySmallBluegray100,
                                      ),
                                    ),
                                    SizedBox(height: 16.v),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "65",
                                        style: CustomTextStyles
                                            .bodySmallBluegray100,
                                      ),
                                    ),
                                    SizedBox(height: 16.v),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "60",
                                        style: CustomTextStyles
                                            .bodySmallBluegray100,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 11.h),
                                  child: SizedBox(
                                    height: 119.v,
                                    child: VerticalDivider(
                                      width: 1.h,
                                      thickness: 1.v,
                                      color: appTheme.blueGray100,
                                      indent: 2.h,
                                      endIndent: 5.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgGroupPrimary,
                            height: 33.v,
                            width: 250.h,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(
                              top: 28.v,
                              right: 1.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 7.v,
                ),
                decoration: AppDecoration.fillGray800931.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 3.v,
                        bottom: 146.v,
                      ),
                      child: Text(
                        "Weight",
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 146.v),
                      child: Text(
                        "+",
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildVectorStack(BuildContext context) {
    return SizedBox(
      height: 181.v,
      width: 327.h,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 21.v),
              child: SizedBox(
                width: 280.h,
                child: Divider(
                  color: appTheme.blueGray100,
                ),
              ),
            ),
          ),
          _buildDurationStack(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventySixColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 36.h,
        vertical: 3.v,
      ),
      decoration: AppDecoration.fillGray800932.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discover",
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 3.v),
          SizedBox(
            height: 91.v,
            child: ListView.separated(
              padding: EdgeInsets.only(right: 5.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  width: 16.h,
                );
              },
              itemCount: 2,
              itemBuilder: (context, index) {
                return RecipelistItemWidget();
              },
            ),
          ),
          SizedBox(height: 79.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Dashboard:
        return AppRoutes.foodLogPage;
      case BottomBarEnum.Food:
        return "/";
      case BottomBarEnum.Workout:
        return "/";
      case BottomBarEnum.Plans:
        return "/";
      case BottomBarEnum.More:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.foodLogPage:
        return FoodLogPage();
      default:
        return DefaultWidget();
    }
  }
}
