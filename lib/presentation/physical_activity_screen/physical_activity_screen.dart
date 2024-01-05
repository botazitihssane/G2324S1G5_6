import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/user.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

class PhysicalActivityScreen extends StatefulWidget {
  const PhysicalActivityScreen({Key? key, required this.user})
      : super(key: key);

  final CustomUser user;

  @override
  _PhysicalActivityScreenState createState() => _PhysicalActivityScreenState();
}

class _PhysicalActivityScreenState extends State<PhysicalActivityScreen> {
  String selectedActivity = ""; // Add this line

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 65.v),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your physical activity ?",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 4.v),
              SizedBox(
                width: 322.h,
                child: Text(
                  "Describe your current activity level. This helps us customize a fitness plan that suits your lifestyle and objectives.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Spacer(flex: 44),
              _buildSedentaryButton(context),
              SizedBox(height: 18.v),
              _buildLightlyActiveButton(context),
              SizedBox(height: 18.v),
              _buildModeratelyActiveButton(context),
              SizedBox(height: 18.v),
              _buildVeryActiveButton(context),
              Spacer(flex: 55),
              SizedBox(height: 9.v),
              Padding(
                padding: EdgeInsets.only(left: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBackButton(context),
                    _buildContinueButton(context),
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
  Widget _buildSedentaryButton(BuildContext context) {
    return _buildActivityButton("Sedentary");
  }

  /// Section Widget
  Widget _buildLightlyActiveButton(BuildContext context) {
    return _buildActivityButton("Lightly active");
  }

  /// Section Widget
  Widget _buildModeratelyActiveButton(BuildContext context) {
    return _buildActivityButton("Moderately active");
  }

  /// Section Widget
  Widget _buildVeryActiveButton(BuildContext context) {
    return _buildActivityButton("Very active");
  }

  Widget _buildActivityButton(String activity,
      {ButtonStyle? buttonStyle, TextStyle? buttonTextStyle}) {
    return Container(
      height: 60.0, // Adjust the height as needed
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: selectedActivity == activity
            ? theme.colorScheme.primary
            : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: selectedActivity == activity
              ? theme.colorScheme.primary
              : Colors.grey,
          width: 2.0,
        ),
      ),
      child: OutlinedButton(
        style: buttonStyle,
        onPressed: () {
          updateSelectedActivity(activity);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              activity,
              style: buttonTextStyle?.merge(
                    TextStyle(
                      fontSize: 18.0, // Adjust the font size as needed
                    ),
                  ) ??
                  CustomTextStyles.bodySmallBlack90001.merge(
                    TextStyle(
                      fontSize: 18.0, // Adjust the font size as needed
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void updateSelectedActivity(String activity) {
    setState(() {
      selectedActivity = activity;
    });
  }

  /// Section Widget
  Widget _buildBackButton(BuildContext context) {
    return CustomElevatedButton(
        width: 150.h,
        text: "Back",
        buttonStyle: CustomButtonStyles.fillGray,
        onPressed: () {
          backToGoal(context);
        });
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
        width: 150.h,
        text: "Continue",
        margin: EdgeInsets.only(left: 13.h),
        onPressed: () {
          navigateToProfil(context);
        });
  }

  /// Navigates to the goalPageScreen when the action is triggered.
  backToGoal(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the profilScreen when the action is triggered.
  navigateToProfil(BuildContext context) {
    CustomUser user = widget.user;
    user.activite_physique = selectedActivity;
    Navigator.pushNamed(
      context,
      AppRoutes.savingPageScreen,
      arguments: user,
    );
  }
}
