import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

// ignore: must_be_immutable
class WorkoutlistItemWidget extends StatelessWidget {
  const WorkoutlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgCed0348bA49b4,
          height: 144.v,
          width: 233.h,
          radius: BorderRadius.circular(
            43.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 33.v,
            bottom: 46.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Warm Up",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 6.h),
                child: Text(
                  "10 min",
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleMediumPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
