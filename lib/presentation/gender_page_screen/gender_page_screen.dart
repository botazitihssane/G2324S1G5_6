import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/user.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_radio_button.dart';

class GenderPageScreen extends StatefulWidget {
  final CustomUser user;
  const GenderPageScreen({Key? key, required this.user}) : super(key: key);

  @override
  _GenderPageScreenState createState() => _GenderPageScreenState();
}

class _GenderPageScreenState extends State<GenderPageScreen> {
  String selectedGender = "";

  @override
  Widget build(BuildContext context) {
    print('Received user type: ${widget.user.runtimeType}');

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 70.v),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tell us about yourself",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 12.v),
              Container(
                width: 315.h,
                margin: EdgeInsets.only(left: 8.h),
                child: Text(
                  "Fuel your fitness journey with customization! Select your gender to tailor your experience.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 50.v),
              _buildGenderRadio1(context),
              SizedBox(height: 50.v),
              _buildGenderRadio2(context),
              Spacer(),
              SizedBox(height: 6.v),
              CustomElevatedButton(
                text: "Continue",
                margin: EdgeInsets.only(right: 13.h),
                onPressed: () {
                  navigateToAge(context);
                },
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderRadio1(BuildContext context) {
    return Column(
      children: [
        _buildEllipseIcon(AppDecoration.fillGray600, Icons.male),
        SizedBox(height: 20.v),
        CustomRadioButton(
          width: 60.h,
          text: "Male",
          value: "Male",
          groupValue: selectedGender,
          decoration: RadioStyleHelper.fillGray600,
          isRightCheck: true,
          onChange: (value) {
            setState(() {
              selectedGender = value;
              widget.user.genre = "Male";
            });
          },
        ),
      ],
    );
  }

  Widget _buildGenderRadio2(BuildContext context) {
    return Column(
      children: [
        _buildEllipseIcon(AppDecoration.fillPrimary, Icons.female),
        SizedBox(height: 20.v),
        CustomRadioButton(
          width: 60.h,
          text: "Female",
          value: "Female",
          groupValue: selectedGender,
          decoration: RadioStyleHelper.fillPrimary,
          isRightCheck: true,
          onChange: (value) {
            setState(() {
              selectedGender = value;
              widget.user.genre = "Female";
            });
          },
        ),
      ],
    );
  }

  Widget _buildEllipseIcon(BoxDecoration decoration, IconData iconData) {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: decoration.color,
      ),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 60.0,
      ),
    );
  }

  void navigateToAge(BuildContext context) {
    CustomUser user = widget.user;
    user.genre = selectedGender;
    print(user.email);
    Navigator.pushNamed(context, AppRoutes.agePageScreen, arguments: user);
  }
}
