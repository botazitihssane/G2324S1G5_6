import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

// ignore: must_be_immutable
class WorkoutcategoriesItemWidget extends StatelessWidget {
  const WorkoutcategoriesItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          SizedBox(
            height: 204.v,
            width: 351.h,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCed0348bA49b4,
                  height: 204.v,
                  width: 351.h,
                  radius: BorderRadius.circular(
                    43.h,
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15.h,
                      bottom: 12.v,
                    ),
                    child: Text(
                      "Day 1 : Warm Up",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 17.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                right: 44.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: Text(
                      "Workout Categories",
                      style: CustomTextStyles.titleSmall14,
                    ),
                  ),
                  Text(
                    "See All",
                    style: CustomTextStyles.titleSmallPrimary,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 13.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 13.h),
                  decoration: AppDecoration.outlineOrange.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 1.v),
                      SizedBox(
                        width: 56.h,
                        child: Text(
                          "Beginner",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMediumKhmerBlack90001,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.v,
                  width: 87.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 25.v,
                          width: 87.h,
                          decoration: BoxDecoration(
                            color: appTheme.gray600,
                            borderRadius: BorderRadius.circular(
                              5.h,
                            ),
                            border: Border.all(
                              color: appTheme.black90001,
                              width: 1.h,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 80.h,
                          child: Text(
                            "Intermediate",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodyMediumKhmerBlack90001,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.v,
                  width: 87.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 25.v,
                          width: 87.h,
                          decoration: BoxDecoration(
                            color: appTheme.gray600,
                            borderRadius: BorderRadius.circular(
                              5.h,
                            ),
                            border: Border.all(
                              color: appTheme.black90001,
                              width: 1.h,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 60.h,
                          child: Text(
                            "Advanced",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodyMediumKhmerBlack90001,
                          ),
                        ),
                      ),
                    ],
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
