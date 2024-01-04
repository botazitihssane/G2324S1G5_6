import '../view_my_workout_page/widgets/category_item_widget.dart';
import '../view_my_workout_page/widgets/workoutcard_item_widget.dart';
import '../view_my_workout_page/widgets/workoutcomponent_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class ViewMyWorkoutPage extends StatefulWidget {
  const ViewMyWorkoutPage({Key? key})
      : super(
          key: key,
        );

  @override
  ViewMyWorkoutPageState createState() => ViewMyWorkoutPageState();
}

class ViewMyWorkoutPageState extends State<ViewMyWorkoutPage>
    with AutomaticKeepAliveClientMixin<ViewMyWorkoutPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 8.v),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategory(context),
                    SizedBox(height: 8.v),
                    Padding(
                      padding: EdgeInsets.only(left: 7.h),
                      child: Row(
                        children: [
                          _buildLatestButton(context),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 24.h,
                              top: 8.v,
                              bottom: 6.v,
                            ),
                            child: Text(
                              "Popular",
                              style: CustomTextStyles
                                  .titleMediumSFProSecondaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.v),
                    _buildWorkoutCard(context),
                    SizedBox(height: 14.v),
                    _buildViewAllButton(context),
                    SizedBox(height: 12.v),
                    Padding(
                      padding: EdgeInsets.only(left: 18.h),
                      child: Text(
                        "Latest Acitivity",
                        style: CustomTextStyles.titleLargeInter,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    _buildWorkoutComponentStack(context),
                    SizedBox(height: 482.v),
                    Text(
                      "Hello Mohamed",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return SizedBox(
      height: 96.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 1.h,
          );
        },
        itemCount: 7,
        itemBuilder: (context, index) {
          return CategoryItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildLatestButton(BuildContext context) {
    return CustomOutlinedButton(
      height: 37.v,
      width: 70.h,
      text: "Latest",
      buttonStyle: CustomButtonStyles.outlinePrimary1,
      buttonTextStyle: CustomTextStyles.titleMediumSFProSemiBold,
    );
  }

  /// Section Widget
  Widget _buildWorkoutCard(BuildContext context) {
    return SizedBox(
      height: 152.v,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 7.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 12.h,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return WorkoutcardItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildViewAllButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "View All",
      margin: EdgeInsets.only(
        left: 7.h,
        right: 35.h,
      ),
      buttonStyle: CustomButtonStyles.outlineSecondaryContainer,
      buttonTextStyle: CustomTextStyles.titleMediumSFProPrimary,
    );
  }

  /// Section Widget
  Widget _buildWorkoutComponentStack(BuildContext context) {
    return Container(
      height: 228.v,
      width: 335.h,
      margin: EdgeInsets.only(left: 23.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 72.h),
              child: Row(
                children: [
                  Text(
                    "Ulangi",
                    style: CustomTextStyles.labelLargeInterLightgreenA400,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    height: 14.adaptSize,
                    width: 14.adaptSize,
                    margin: EdgeInsets.only(
                      left: 3.h,
                      bottom: 1.v,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 6.v),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return SizedBox(
                    height: 20.v,
                  );
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  return WorkoutcomponentItemWidget();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
