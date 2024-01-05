import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/user.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

class HeightPageScreen extends StatefulWidget {
  final CustomUser user;

  const HeightPageScreen({Key? key, required this.user}) : super(key: key);

  @override
  _HeightPageScreenState createState() => _HeightPageScreenState();
}

class _HeightPageScreenState extends State<HeightPageScreen> {
  TextEditingController heightController = TextEditingController();
  int selectedHeight = 150;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 66.v),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("What is your height ?",
                  style: theme.textTheme.headlineLarge),
              SizedBox(height: 12.v),
              Container(
                width: 268.h,
                margin: EdgeInsets.only(left: 27.h, right: 28.h),
                child: Text(
                  "Enter your height, and we'll customize your fitness plan to elevate your goals!",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Spacer(flex: 43),
              _buildHeightSelector(),
              Spacer(flex: 56),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 11.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        text: "Back",
                        margin: EdgeInsets.only(right: 7.h),
                        buttonStyle: CustomButtonStyles.fillGray,
                        onPressed: () {
                          backToAge(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        text: "Continue",
                        margin: EdgeInsets.only(left: 7.h),
                        onPressed: () {
                          widget.user.taille = selectedHeight + 0.0;
                          navigateToWeight(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeightSelector() {
    return SizedBox(
      height: 400.v,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(101, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedHeight = 100 + index;
                  heightController.text = selectedHeight.toString();
                });
              },
              child: Container(
                height: 50.h,
                width: 80.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: selectedHeight == 100 + index
                          ? theme.colorScheme.primary
                          : Colors.transparent,
                      width: 2.0,
                    ),
                    bottom: BorderSide(
                      color: selectedHeight == 100 + index
                          ? theme.colorScheme.primary
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  (100 + index).toString(),
                  style: TextStyle(
                    fontSize: 22.0,
                    color: selectedHeight == 100 + index
                        ? theme.colorScheme.primary
                        : Colors.white,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void backToAge(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToWeight(BuildContext context) {
    print(widget.user.age);
    print(widget.user.genre);
    print(widget.user.taille);
    CustomUser user = widget.user;
    user.taille = selectedHeight + 0.0;
    Navigator.pushNamed(context, AppRoutes.weightPageScreen, arguments: user);
  }
}
