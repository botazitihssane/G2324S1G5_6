import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/user.dart';
import 'package:wotkout_app/presentation/height_page_screen/height_page_screen.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

class AgePageScreen extends StatefulWidget {
  final CustomUser user;

  const AgePageScreen({Key? key, required this.user}) : super(key: key);

  @override
  _AgePageScreenState createState() => _AgePageScreenState();
}

class _AgePageScreenState extends State<AgePageScreen> {
  TextEditingController ageController = TextEditingController();
  int selectedAge = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 70.v),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How old are you ?", style: theme.textTheme.headlineLarge),
              SizedBox(height: 11.v),
              Container(
                width: 304.h,
                margin: EdgeInsets.only(left: 9.h, right: 4.h),
                child: Text(
                  "Tell us your age, and together, we'll create a customized plan designed just for you!",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Spacer(flex: 44),
              _buildAgeSelector(),
              Spacer(flex: 55),
              SizedBox(height: 6.v),
              Padding(
                padding: EdgeInsets.only(left: 9.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomElevatedButton(
                      width: 150.h,
                      text: "Back",
                      buttonStyle: CustomButtonStyles.fillGray,
                      onPressed: () {
                        backToGender(context);
                      },
                    ),
                    CustomElevatedButton(
                      width: 150.h,
                      text: "Continue",
                      margin: EdgeInsets.only(left: 9.h),
                      onPressed: () {
                        widget.user.age = selectedAge;
                        navigateToHeight(context);
                      },
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

  Widget _buildAgeSelector() {
    return Column(
      children: [
        SizedBox(
          height: 300.v,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(100, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAge = index;
                      ageController.text = selectedAge.toString();
                    });
                  },
                  child: Container(
                    height: 50.h,
                    width: 80.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: selectedAge == index
                              ? theme.colorScheme.primary
                              : Colors.transparent,
                          width: 2.0,
                        ),
                        bottom: BorderSide(
                          color: selectedAge == index
                              ? theme.colorScheme.primary
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        fontSize: 22.0,
                        color: selectedAge == index
                            ? theme.colorScheme.primary
                            : Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(height: 18.v),
        Container(
          width: 80.h,
          child: TextField(
            controller: ageController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                selectedAge = int.tryParse(value) ?? 0;
              });
            },
            decoration: InputDecoration(
              hintText: "Enter Age",
            ),
          ),
        ),
      ],
    );
  }

  void backToGender(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToHeight(BuildContext context) {
    CustomUser user = widget.user;
    user.age = selectedAge;
    Navigator.pushNamed(context, AppRoutes.heightPageScreen, arguments: user);
  }
}
