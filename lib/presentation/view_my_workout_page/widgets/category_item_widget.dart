import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

// ignore: must_be_immutable
class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.v,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
      ),
    );
  }
}
