import '../steps_screen/widgets/viewhierarchy_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/presentation/food_log_container_page/food_log_container_page.dart';
import 'package:wotkout_app/widgets/custom_bottom_bar.dart';

class StepsScreen extends StatelessWidget {
  StepsScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 38.v),
              _buildStepsColumn(context),
              SizedBox(height: 23.v),
              _buildEntriesStack(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBarColumn(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildStepsColumn(BuildContext context) {
    return Column(
      children: [
        Text(
          "Steps",
          style: theme.textTheme.headlineLarge,
        ),
        SizedBox(height: 35.v),
        SizedBox(
          height: 273.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(left: 1.h),
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  decoration: AppDecoration.fillGray800931,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 12.h,
                          right: 18.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgCalendar,
                              height: 18.adaptSize,
                              width: 18.adaptSize,
                              margin: EdgeInsets.only(
                                top: 7.v,
                                bottom: 5.v,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.v,
                                bottom: 7.v,
                              ),
                              child: Text(
                                "1 week ",
                                style: CustomTextStyles.labelMediumWhiteA700,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgArrowUpIndigoA40001,
                              height: 3.v,
                              width: 5.h,
                              margin: EdgeInsets.only(
                                left: 6.h,
                                top: 16.v,
                                bottom: 12.v,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: SizedBox(
                                height: 32.v,
                                child: VerticalDivider(
                                  width: 1.h,
                                  thickness: 1.v,
                                ),
                              ),
                            ),
                            Container(
                              width: 153.h,
                              margin: EdgeInsets.only(
                                left: 10.h,
                                top: 7.v,
                                bottom: 5.v,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgSettings,
                                    height: 18.adaptSize,
                                    width: 18.adaptSize,
                                    margin: EdgeInsets.only(bottom: 1.v),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.v),
                                    child: Text(
                                      "Add data",
                                      style: CustomTextStyles
                                          .labelMediumWhiteA700
                                          .copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 11.h,
                          right: 18.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "2864",
                                  style: theme.textTheme.labelLarge,
                                ),
                                Text(
                                  "AVERAGE",
                                  style: CustomTextStyles.bodySmall8,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 190.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "8456",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                      Text(
                                        "14598",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 187.h,
                                  margin: EdgeInsets.only(right: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "BEST",
                                        style: CustomTextStyles.bodySmall8,
                                      ),
                                      Text(
                                        "TOTAL",
                                        style: CustomTextStyles.bodySmall8,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13.v),
                      SizedBox(
                        height: 180.v,
                        width: 366.h,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "10000",
                                        style:
                                            CustomTextStyles.bodySmallGray600,
                                      ),
                                      SizedBox(height: 25.v),
                                      Text(
                                        "7500",
                                        style:
                                            CustomTextStyles.bodySmallGray600,
                                      ),
                                      SizedBox(height: 28.v),
                                      Text(
                                        "5000",
                                        style:
                                            CustomTextStyles.bodySmallGray600,
                                      ),
                                      SizedBox(height: 29.v),
                                      Text(
                                        "2500",
                                        style:
                                            CustomTextStyles.bodySmallGray600,
                                      ),
                                      SizedBox(height: 28.v),
                                      Text(
                                        "0",
                                        style:
                                            CustomTextStyles.bodySmallGray600,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.h),
                                    child: SizedBox(
                                      height: 166.v,
                                      child: VerticalDivider(
                                        width: 1.h,
                                        thickness: 1.v,
                                        indent: 3.h,
                                        endIndent: 3.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgGroup,
                              height: 157.v,
                              width: 337.h,
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(
                                top: 5.v,
                                right: 1.h,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 16.v),
                                child: SizedBox(
                                  width: 340.h,
                                  child: Divider(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 26.h,
                                  top: 163.v,
                                  right: 88.h,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgGroupGray600,
                                      height: 6.v,
                                      width: 1.h,
                                      margin: EdgeInsets.only(bottom: 11.v),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 7.h,
                                        top: 6.v,
                                      ),
                                      child: Text(
                                        "03/11",
                                        style:
                                            CustomTextStyles.bodySmallGray600,
                                      ),
                                    ),
                                    Spacer(
                                      flex: 29,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5.v),
                                      child: Text(
                                        "10/11",
                                        style:
                                            CustomTextStyles.bodySmallGray600,
                                      ),
                                    ),
                                    Spacer(
                                      flex: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 6.v),
                                      child: Text(
                                        "17/11",
                                        style:
                                            CustomTextStyles.bodySmallGray600,
                                      ),
                                    ),
                                    Spacer(
                                      flex: 29,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 6.v),
                                      child: Text(
                                        "24/11",
                                        style:
                                            CustomTextStyles.bodySmallGray600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 7.h,
                                  bottom: 2.v,
                                ),
                                child: Text(
                                  "01/12",
                                  style: CustomTextStyles.bodySmallGray600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13.v),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 71.v),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Divider(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 33.v),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Divider(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEntriesStack(BuildContext context) {
    return SizedBox(
      height: 388.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 7.v),
              decoration: AppDecoration.fillGray800931,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 26.h),
                    child: Text(
                      "Entries",
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Column(
                    children: [
                      Container(
                        decoration: AppDecoration.fillGray800931,
                        child: Column(
                          children: [
                            Divider(),
                            SizedBox(height: 9.v),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.h,
                                right: 35.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sunday, 3 December 2023",
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  Text(
                                    "1903",
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 9.v),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  SizedBox(height: 8.v),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: 67.v,
                bottom: 40.v,
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ViewhierarchyItemWidget();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBarColumn(BuildContext context) {
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
        return AppRoutes.foodLogContainerPage;
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
      case AppRoutes.foodLogContainerPage:
        return FoodLogContainerPage();
      default:
        return DefaultWidget();
    }
  }
}
