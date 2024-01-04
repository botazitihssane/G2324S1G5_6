import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

// ignore: must_be_immutable
class ColumnsectionItemWidget extends StatelessWidget {
  const ColumnsectionItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillGray800931,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 5.v),
          Text(
            "Lunch",
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 20.v),
          Text(
            "Add food",
            style: theme.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
