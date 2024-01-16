import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/workoutHistory.dart';

class WorkoutcomponentItemWidget extends StatelessWidget {
  final WorkoutHistory workoutData;

  const WorkoutcomponentItemWidget({
    Key? key,
    required this.workoutData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildWorkoutItem(context, workoutData),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildWorkoutItem(BuildContext context, WorkoutHistory workoutData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: workoutData.photo ?? ImageConstant.imageNotFound,
          height: 56.adaptSize,
          width: 56.adaptSize,
          radius: BorderRadius.circular(8.h),
          margin: EdgeInsets.only(top: 2.v, bottom: 3.v),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                workoutData.titre ?? "",
                style: CustomTextStyles.titleSmallInter,
              ),
              SizedBox(height: 6.v),
              Row(
                children: [
                  Text(
                    "Calories:",
                    style: CustomTextStyles.bodyMediumInterWhiteA700,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "${workoutData.calories ?? 'N/A'} kcal",
                      style: CustomTextStyles.bodyMediumInterWhiteA700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.v),
              Row(
                children: [
                  Text(
                    "Time",
                    style: CustomTextStyles.bodyMediumInterWhiteA700,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "${workoutData.duree ?? 'N/A'} minutes",
                      style: CustomTextStyles.bodyMediumInterWhiteA700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () async {
            String? catId = workoutData.catId;
            String? docId = workoutData.docId;

            if (catId != null && docId != null) {
              Navigator.pushNamed(
                context,
                AppRoutes.startWorkoutChestScreen,
                arguments: {'catId': catId, 'docId': docId},
              );
            }
          },
          child: Container(
            height: 50.adaptSize,
            width: 200.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 6.v),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "Repeat",
                  style: CustomTextStyles.labelLargeInterLightgreenA400,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
