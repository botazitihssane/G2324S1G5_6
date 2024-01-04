import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

// ignore: must_be_immutable
class RecipelistItemWidget extends StatelessWidget {
  const RecipelistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.v),
      padding: EdgeInsets.symmetric(
        horizontal: 37.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillGray800931.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      width: 150.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 28.v,
            width: 29.h,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgClosePrimary,
                  height: 28.v,
                  width: 29.h,
                  alignment: Alignment.center,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgFoodTurkey,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 3.h),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.v),
          Text(
            "Recipes",
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 2.v),
          Text(
            "Cook, eat, log, repeat",
            style: CustomTextStyles.bodySmall8,
          ),
        ],
      ),
    );
  }
}
