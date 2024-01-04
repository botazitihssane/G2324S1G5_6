import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

// ignore: must_be_immutable
class ViewhierarchycomponentItemWidget extends StatelessWidget {
  const ViewhierarchycomponentItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Container(
            decoration: AppDecoration.fillGray800931,
            child: Column(
              children: [
                Divider(),
                SizedBox(height: 9.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25.h,
                    right: 34.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Saturday, 2 December 2023",
                        style: theme.textTheme.bodySmall,
                      ),
                      Text(
                        "2489",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 9.v),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
