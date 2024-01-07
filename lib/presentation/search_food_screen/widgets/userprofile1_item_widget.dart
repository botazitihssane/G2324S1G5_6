import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_icon_button.dart';

class Userprofile1ItemWidget extends StatelessWidget {
  final String foodName;
  final int calories;
  final String servingSize;
  final VoidCallback onAddButtonPressed;

  const Userprofile1ItemWidget({
    Key? key,
    required this.foodName,
    required this.calories,
    required this.servingSize,
    required this.onAddButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAddButtonPressed, // Navigate when tapped
      child: Container(
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
                    foodName,
                    style: CustomTextStyles.bodySmall12,
                  ),
                  Text(
                    "$calories cal, $servingSize",
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
      ),
    );
  }
}
