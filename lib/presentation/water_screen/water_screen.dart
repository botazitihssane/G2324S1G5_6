import '../water_screen/widgets/mlchipview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

class WaterScreen extends StatelessWidget {
  const WaterScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray900,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 33.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 27.h,
                  vertical: 11.v,
                ),
                decoration: AppDecoration.fillGray80093.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCancelRow(context),
                    SizedBox(height: 87.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgImgbinWaterBo,
                      height: 69.v,
                      width: 100.h,
                    ),
                    SizedBox(height: 28.v),
                    Container(
                      width: 100.h,
                      margin: EdgeInsets.symmetric(horizontal: 119.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.h,
                        vertical: 6.v,
                      ),
                      decoration: AppDecoration.outlineIndigoA.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder2,
                      ),
                      child: SizedBox(
                        height: 26.v,
                        child: VerticalDivider(
                          width: 1.h,
                          thickness: 1.v,
                          color: appTheme.indigoA40001,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    _buildMlChipView(context),
                    SizedBox(height: 20.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCancelRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Cancel",
            style: theme.textTheme.titleLarge,
          ),
          Spacer(
            flex: 44,
          ),
          Text(
            "Water",
            style: CustomTextStyles.titleLargePrimary_1,
          ),
          Spacer(
            flex: 55,
          ),
          Text(
            "Add",
            style: CustomTextStyles.titleLargeIndigoA40001,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMlChipView(BuildContext context) {
    return Wrap(
      runSpacing: 14.v,
      spacing: 14.h,
      children: List<Widget>.generate(3, (index) => MlchipviewItemWidget()),
    );
  }
}
