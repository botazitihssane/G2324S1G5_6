import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class WorkoutcardItemWidget extends StatelessWidget {
  const WorkoutcardItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 15.v,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder10,
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgFrame29,
          ),
          fit: BoxFit.cover,
        ),
      ),
      width: 260.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 119.h,
                child: Text(
                  "Belly fat burner for Beginner",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumSFPro,
                ),
              ),
              SizedBox(height: 5.v),
              CustomElevatedButton(
                height: 19.v,
                width: 84.h,
                text: "No Equipment",
                buttonStyle: CustomButtonStyles.fillIndigoA,
                buttonTextStyle: CustomTextStyles.bodySmallSFPro,
              ),
            ],
          ),
          SizedBox(height: 45.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgTime,
                height: 6.adaptSize,
                width: 6.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 2.v),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text(
                  "20 Min",
                  style: CustomTextStyles.bodySmallSFPro,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgFlameLine,
                height: 6.adaptSize,
                width: 6.adaptSize,
                margin: EdgeInsets.only(
                  left: 9.h,
                  top: 2.v,
                  bottom: 2.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text(
                  "432 Kcal",
                  style: CustomTextStyles.bodySmallSFPro,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
