import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../steps_screen/widgets/viewhierarchycomponent_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/presentation/food_log_page/food_log_page.dart';
import 'package:wotkout_app/widgets/custom_bottom_bar.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

class StepsScreen extends StatefulWidget {
  StepsScreen({Key? key}) : super(key: key);

  @override
  _StepsScreenState createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late Future<List<DocumentSnapshot<Object?>>> _userSteps;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  User? _user;
  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _userSteps = _fetchUserSteps();
  }

  Future<List<DocumentSnapshot>> _fetchUserSteps() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: _user!.email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String userId = querySnapshot.docs.first.id;
        QuerySnapshot stepsSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('steps')
            .get();

        return stepsSnapshot.docs;
      }

      return [];
    } catch (error) {
      print("Error fetching user steps: $error");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.v),
              FutureBuilder<List<DocumentSnapshot<Object?>>>(
                future: _userSteps,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }

                  List<DocumentSnapshot<Object?>> steps = snapshot.data ?? [];

                  return Column(
                    children: [
                      _buildStepsColumn(context, steps),
                      SizedBox(height: 10.v),
                      _buildEntriesStack(steps),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBarColumn(context),
      ),
    );
  }

  Widget _buildStepsColumn(BuildContext context, List<DocumentSnapshot> steps) {
    return Column(
      children: [
        Text(
          "Steps",
          style: theme.textTheme.headlineLarge,
        ),
        SizedBox(
          height: 150.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(left: 1.h),
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  decoration: AppDecoration.fillGray800931,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHeaderRow(),
                      SizedBox(height: 25.v),
                      _buildDataSummaryRow(steps),
                      SizedBox(height: 15.v),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 71.v),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Divider(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 33.v),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Divider(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: EdgeInsets.only(left: 12.h, right: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          Container(
            width: 153.h,
            margin: EdgeInsets.only(left: 10.h, top: 7.v, bottom: 5.v),
            child: GestureDetector(
              onTap: () {
                navigateToAddSteps(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.v, right: 15.v),
                    child: Text(
                      "Add data",
                      style: CustomTextStyles.labelMediumWhiteA700.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDataSummaryRow(List<DocumentSnapshot> steps) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h, right: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
        children: [
          Text(
            "Total: ${calculateTotalSteps(steps)}",
            style: theme.textTheme.bodySmall,
          ),
          Text(
            "Best: ${calculateBestSteps(steps)}",
            style: theme.textTheme.bodySmall,
          ),
          Text(
            "Average: ${calculateAverageSteps(steps).toStringAsFixed(2)}",
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

// Helper methods for calculations
  int calculateTotalSteps(List<DocumentSnapshot> steps) {
    int totalSteps = 0;
    for (var step in steps) {
      totalSteps += (step['nombre'] ?? 0) as int;
    }
    return totalSteps;
  }

  int calculateBestSteps(List<DocumentSnapshot> steps) {
    int bestSteps = 0;
    for (var step in steps) {
      int currentSteps = step['nombre'] ?? 0;
      if (currentSteps > bestSteps) {
        bestSteps = currentSteps;
      }
    }
    return bestSteps;
  }

  double calculateAverageSteps(List<DocumentSnapshot> steps) {
    int totalSteps = calculateTotalSteps(steps);
    int numberOfEntries = steps.length;

    if (numberOfEntries > 0) {
      return totalSteps / numberOfEntries;
    } else {
      return 0.0;
    }
  }

  Widget _buildEntriesStack(List<DocumentSnapshot> steps) {
    steps.sort((a, b) {
      DateTime dateA = DateTime.parse(a['date']);
      DateTime dateB = DateTime.parse(b['date']);
      return dateB.compareTo(dateA);
    });
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.v),
      decoration: AppDecoration.fillGray800931,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.v,
          ),
          Padding(
            padding: EdgeInsets.only(left: 26.h),
            child: Text(
              "Entries",
              style: theme.textTheme.labelLarge,
            ),
          ),
          SizedBox(height: 8.v),
          for (var step in steps) _buildStepEntry(step['date'], step['nombre']),
          SizedBox(height: 8.v),
        ],
      ),
    );
  }

  Widget _buildStepEntry(String date, int count) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat.yMMMMd().format(dateTime);

    return Column(
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
                  right: 35.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formattedDate,
                      style: theme.textTheme.bodySmall,
                    ),
                    Text(
                      count.toString(),
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 9.v),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildBottomBarColumn(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Dashboard:
        return AppRoutes.foodLogPage;
      case BottomBarEnum.Food:
        return "/";
      case BottomBarEnum.Workout:
        return "/";
      case BottomBarEnum.Plans:
        return "/";
      case BottomBarEnum.More:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.foodLogPage:
        return FoodLogPage();
      default:
        return DefaultWidget();
    }
  }
}

void navigateToAddSteps(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.addStepsScreen);
}
