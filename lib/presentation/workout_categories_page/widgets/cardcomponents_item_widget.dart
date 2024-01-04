import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

// ignore: must_be_immutable
class CardcomponentsItemWidget extends StatelessWidget {
  const CardcomponentsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 160.v,
        width: 327.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage,
              height: 160.v,
              width: 327.h,
              radius: BorderRadius.circular(
                16.h,
              ),
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                  vertical: 13.v,
                ),
                decoration: AppDecoration
                    .gradientOnErrorContainerToOnErrorContainer
                    .copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 89.v),
                    Text(
                      "Wake Up Call",
                      style: CustomTextStyles.titleMediumOpenSans,
                    ),
                    SizedBox(height: 2.v),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 11.v,
                          width: 2.h,
                          margin: EdgeInsets.only(
                            top: 1.v,
                            bottom: 5.v,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "04 Workouts  for Beginner",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
