import '../workout_home_screen/widgets/workoutcategories_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_title.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';

class WorkoutHomeScreen extends StatelessWidget {
  const WorkoutHomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 67.v),
            child: Padding(
              padding: EdgeInsets.only(right: 23.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 34.h),
                    child: Text(
                      "Today’s Workout Plan",
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(height: 44.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 26.h),
                      child: Text(
                        "28 Nov 2023",
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 21.v),
                  _buildWorkoutCategories(context),
                  SizedBox(height: 518.v),
                  Text(
                    "Hello Mohamed",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displayMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 19.h),
        child: Column(
          children: [
            AppbarTitle(
              text: "Hello MOHAMED",
              margin: EdgeInsets.only(left: 1.h),
            ),
            SizedBox(height: 5.v),
            Container(
              height: 8.v,
              width: 202.h,
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
            horizontal: 33.h,
            vertical: 3.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildWorkoutCategories(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 19.h),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 32.v,
            );
          },
          itemCount: 2,
          itemBuilder: (context, index) {
            return WorkoutcategoriesItemWidget();
          },
        ),
      ),
    );
  }
}
