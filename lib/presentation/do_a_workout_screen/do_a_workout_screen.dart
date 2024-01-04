import '../do_a_workout_screen/widgets/workoutlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_title.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_outlined_button.dart';

class DoAWorkoutScreen extends StatelessWidget {
  const DoAWorkoutScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 7.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 28.h),
                child: Text(
                  "Chest Workout",
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineSmallPrimary,
                ),
              ),
              SizedBox(height: 21.v),
              _buildWorkoutList(context),
              SizedBox(height: 20.v),
              CustomOutlinedButton(
                height: 35.v,
                width: 192.h,
                text: "Finish Workout",
                margin: EdgeInsets.only(right: 5.h),
                buttonStyle: CustomButtonStyles.outlineOrangeTL5,
                buttonTextStyle: CustomTextStyles.titleLargeBlack90001,
                alignment: Alignment.centerRight,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 15.h),
        child: Column(
          children: [
            AppbarTitle(
              text: "Today’s Workout Plan",
            ),
            Container(
              height: 8.v,
              width: 252.h,
              margin: EdgeInsets.only(
                left: 4.h,
                right: 1.h,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingCircleimage(
          imagePath: ImageConstant.imgIndianMan8043472128050x58,
          margin: EdgeInsets.symmetric(
            horizontal: 25.h,
            vertical: 3.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildWorkoutList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 17.h),
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
          return WorkoutlistItemWidget();
        },
      ),
    );
  }
}
