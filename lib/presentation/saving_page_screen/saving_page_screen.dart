import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

class SavingPageScreen extends StatelessWidget {
  const SavingPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 7.v),
              Text(
                "Saving ... ",
                style: theme.textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
