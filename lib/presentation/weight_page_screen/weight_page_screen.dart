import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/user.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';

class WeightPageScreen extends StatefulWidget {
  final CustomUser user;

  const WeightPageScreen({Key? key, required this.user}) : super(key: key);

  @override
  _WeightPageScreenState createState() => _WeightPageScreenState();
}

class _WeightPageScreenState extends State<WeightPageScreen> {
  int selectedWeight = 60;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 69.v),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("What is your weight ?",
                  style: theme.textTheme.headlineLarge),
              SizedBox(height: 9.v),
              Container(
                width: 277.h,
                margin: EdgeInsets.only(left: 24.h, right: 22.h),
                child: Text(
                  "Share your weight, and we'll tailor your fitness plan for optimal results!",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Spacer(flex: 47),
              _buildWeightSelector(),
              SizedBox(height: 31.v),
              CustomImageView(
                imagePath: ImageConstant.imgArrowUp,
                height: 13.v,
                width: 25.h,
              ),
              Spacer(flex: 52),
              SizedBox(height: 6.v),
              _buildEightyTwo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightSelector() {
    return SizedBox(
      height: 120.v,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 181,
        itemBuilder: (context, index) {
          final weight = index + 20;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedWeight = weight;
              });

              // Calculate the position to center the selected item
              double offset = (weight - 20) * 60.h -
                  (MediaQuery.of(context).size.width - 60.h) / 2.5;

              // Scroll the selected item to the center
              _scrollController.animateTo(
                offset,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              height: 50.h,
              width: 60.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: selectedWeight == weight
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                    width: 2.0,
                  ),
                  right: BorderSide(
                    color: selectedWeight == weight
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: Text(
                weight.toString(),
                style: TextStyle(
                  fontSize: 22.0,
                  color: selectedWeight == weight
                      ? theme.colorScheme.primary
                      : Colors.white,
                ),
              ),
            ),
          );
        },
        // Use the scroll controller
        controller: _scrollController,
      ),
    );
  }

// Add this member variable to your State class
  late ScrollController _scrollController;

// Initialize the scroll controller in initState
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  Widget _buildEightyTwo(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(right: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomElevatedButton(
                text: "Back",
                margin: EdgeInsets.only(right: 7.h, bottom: 1.v),
                buttonStyle: CustomButtonStyles.fillGray,
                onPressed: () {
                  backToHeight(context);
                },
              ),
            ),
            Expanded(
              child: CustomElevatedButton(
                text: "Continue",
                margin: EdgeInsets.only(left: 7.h),
                onPressed: () {
                  widget.user.poids = selectedWeight + 0.0;
                  navigateToGoal(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  backToHeight(BuildContext context) {
    Navigator.pop(context);
  }

  navigateToGoal(BuildContext context) {
    CustomUser user = widget.user;
    user.poids = selectedWeight + 0.0;
    Navigator.pushNamed(context, AppRoutes.goalPageScreen, arguments: user);
  }
}
