import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  const UserprofileItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.fillGray800931.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 28.v,
            width: 113.h,
            margin: EdgeInsets.only(
              left: 1.h,
              top: 2.v,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Riz Jaune",
                    style: CustomTextStyles.bodySmall12,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "279 cal, 80g, Arroz Cigala",
                    style: CustomTextStyles.bodySmallBluegray100_1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 20.v,
            width: 19.h,
            margin: EdgeInsets.symmetric(vertical: 5.v),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomIconButton(
                  height: 20.v,
                  width: 19.h,
                  alignment: Alignment.center,
                  child: CustomImageView(),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "+",
                    style: CustomTextStyles.bodyMediumInikaIndigoA40001,
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
