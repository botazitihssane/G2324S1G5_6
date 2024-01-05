import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/user.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

class GoalPageScreen extends StatefulWidget {
  GoalPageScreen({Key? key, required this.user}) : super(key: key);

  final CustomUser user;

  @override
  _GoalPageScreenState createState() => _GoalPageScreenState();
}

class _GoalPageScreenState extends State<GoalPageScreen> {
  String selectedGoal = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 32.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What is your goal ?",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 7.v),
              SizedBox(
                width: 322.h,
                child: Text(
                  "What are you looking to achieve, and how can we assist you on this empowering adventure?",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 18.v),
              _buildGoalCheckboxes(context),
              SizedBox(height: 86.v),
              Padding(
                padding: EdgeInsets.only(left: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBack(context),
                    _buildContinue(context),
                  ],
                ),
              ),
              SizedBox(height: 8.v),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoalCheckboxes(BuildContext context) {
    return Column(
      children: [
        _buildCheckboxTile("Weight loss"),
        _buildCheckboxTile("Lean muscle gain"),
        _buildCheckboxTile("Weight maintenance"),
        _buildCheckboxTile("Body recomposition"),
        _buildCheckboxTile("Healthy weight gain"),
        _buildCheckboxTile("Balanced fitness lifestyle"),
      ],
    );
  }

  Widget _buildCheckboxTile(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: selectedGoal == title ? theme.colorScheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color:
              selectedGoal == title ? theme.colorScheme.primary : Colors.grey,
          width: 2.0,
        ),
      ),
      child: CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(
            color: selectedGoal == title ? Colors.white : Colors.black,
          ),
        ),
        value: selectedGoal == title,
        onChanged: (value) {
          setState(() {
            selectedGoal = value ?? false ? title : "";
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.transparent,
        checkColor: Colors.white,
      ),
    );
  }

  Widget _buildBack(BuildContext context) {
    return CustomElevatedButton(
      width: 150.h,
      text: "Back",
      buttonStyle: CustomButtonStyles.fillGray,
      onPressed: () {
        backToWeight(context);
      },
    );
  }

  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
      width: 150.h,
      text: "Continue",
      margin: EdgeInsets.only(left: 13.h),
      onPressed: () {
        navigateToActivity(context);
      },
    );
  }

  void backToWeight(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToActivity(BuildContext context) {
    CustomUser user = widget.user;
    user.objectif = selectedGoal;
    Navigator.pushNamed(
      context,
      AppRoutes.physicalActivityScreen,
      arguments: user,
    );
  }
}
