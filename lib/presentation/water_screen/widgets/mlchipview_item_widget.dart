import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

class _MlchipviewItemWidget extends StatelessWidget {
  final String label;

  const _MlchipviewItemWidget({Key? key, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 12.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        label,
        style: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 15.fSize,
          fontFamily: 'Inika',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.gray80093,
      selectedColor: appTheme.gray80093,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.blueGray100,
          width: 2.h,
        ),
        borderRadius: BorderRadius.circular(
          2.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
