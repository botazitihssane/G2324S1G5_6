import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class WorkoutcardItemWidget extends StatelessWidget {
  final String title;
  final String duration;
  final String calories;
  final String photo;

  const WorkoutcardItemWidget(
      {Key? key,
      required this.title,
      required this.duration,
      required this.calories,
      required this.photo})
      : super(key: key);

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
          image: NetworkImage(
            photo,
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
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumSFPro,
                ),
              ),
              SizedBox(height: 5.v),
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
                  duration,
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
                  calories,
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
