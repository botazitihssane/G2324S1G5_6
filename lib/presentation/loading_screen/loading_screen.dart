import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: SizedBox(
          width: double.maxFinite,
          child: CustomImageView(
            imagePath: ImageConstant.imgVector,
            height: 80.v,
            width: 160.h,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
