import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  const Userprofile1ItemWidget({Key? key})
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
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              top: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nutella",
                  style: CustomTextStyles.bodySmall12,
                ),
                Text(
                  "200 cal, 2 tablespoon",
                  style: CustomTextStyles.bodySmallBluegray100_1,
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
