// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/presentation/food_log_page/food_log_page.dart';
import 'package:wotkout_app/widgets/custom_bottom_bar.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key})
      : super(
          key: key,
        );

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  Future<int> _fetchAccumulatedStepsForToday() async {
    try {
      String formattedDate = _getFormattedDate();
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
            .where('date', isEqualTo: formattedDate)
            .get();

        int totalSteps = 0;
        stepsSnapshot.docs.forEach((stepDoc) {
          print(stepDoc['nombre']);
          totalSteps += (stepDoc['nombre'] as int);
        });

        return totalSteps;
      }

      return 0;
    } catch (error) {
      print("Error fetching user steps: $error");
      return 0;
    }
  }

  String _getFormattedDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  Future<Map<String, dynamic>> _fetchAccumulatedWorkoutDataForToday() async {
    try {
      String formattedDate = _getFormattedDate();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('workoutHistory')
          .where('date', isEqualTo: formattedDate)
          .where('email', isEqualTo: _user!.email)
          .get();

      int totalCalories = 0;
      int totalDuration = 0;

      querySnapshot.docs.forEach((workoutDoc) {
        print(workoutDoc['calories']);
        totalCalories += (workoutDoc['calories'] as int);
        totalDuration += (workoutDoc['duree'] as int);
      });

      return {
        'totalCalories': totalCalories,
        'totalDuration': totalDuration,
      };
    } catch (error) {
      print("Error fetching user workout data: $error");
      return {
        'totalCalories': 0,
        'totalDuration': 0,
      };
    }
  }

  Future<int> _fetchDailyFoodLog() async {
    try {
      String formattedDate = _getFormattedDate();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('dailyFoodLog')
          .where('user', isEqualTo: _user!.email)
          .where('date', isEqualTo: formattedDate)
          .get();

      int totalCalories = 0;
      if (querySnapshot.docs.isNotEmpty) {
        print('snapshot not empty');
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          if (document.reference.collection('breakfast').id == 'breakfast') {
            QuerySnapshot breakfastSnapshot =
                await document.reference.collection('breakfast').get();

            for (QueryDocumentSnapshot breakfastDoc in breakfastSnapshot.docs) {
              int calories = (breakfastDoc['calories'] as int);
              print("Breakfast Calories: $calories");
              totalCalories += calories;
            }
          }

          if (document.reference.collection('lunch').id == 'lunch') {
            QuerySnapshot lunchSnapshot =
                await document.reference.collection('lunch').get();

            for (QueryDocumentSnapshot lunchDoc in lunchSnapshot.docs) {
              int calories = (lunchDoc['calories'] as int);
              print("Lunch Calories: $calories");
              totalCalories += calories;
            }
          }

          if (document.reference.collection('snack').id == 'snack') {
            QuerySnapshot snackSnapshot =
                await document.reference.collection('snack').get();

            for (QueryDocumentSnapshot snackDoc in snackSnapshot.docs) {
              int calories = (snackDoc['calories'] as int);
              print("Snack Calories: $calories");
              totalCalories += calories;
            }
          }

          if (document.reference.collection('diner').id == 'diner') {
            QuerySnapshot dinerSnapshot =
                await document.reference.collection('diner').get();

            for (QueryDocumentSnapshot dinerDoc in dinerSnapshot.docs) {
              int calories = (dinerDoc['calories'] as int);
              print("Diner Calories: $calories");
              totalCalories += calories;
            }
          }
        }
      }
      return totalCalories;
    } catch (error) {
      print("Error fetching daily food log: $error");
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 30.v),
              _buildMyWorkoutRow(context),
              SizedBox(height: 25.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today",
                      style: CustomTextStyles.titleLarge20,
                    ),
                    Container(
                      width: 45.h,
                      margin: EdgeInsets.only(
                        bottom: 5.v,
                        right: 5.h,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 11.h,
                        vertical: 5.v,
                      ),
                      decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "Edit",
                        style: CustomTextStyles.bodySmall12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.v),
              _buildSeventySevenColumn(context),
              SizedBox(height: 19.v),
              _buildStepsRow(context),
              SizedBox(height: 19.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildMyWorkoutRow(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 36.h),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 14.v,
                        bottom: 8.v,
                      ),
                      child: Text(
                        "MyWorkout",
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(width: 170.h),
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () async {
                        await _auth.signOut();
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.signInScreen);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 281.h,
                  top: 12.v,
                  bottom: 12.v,
                ),
                child: Text(
                  "MyWorkout",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeventySevenColumn(BuildContext context) {
    return FutureBuilder<int>(
        future: _fetchDailyFoodLog(),
        builder: (context, snapshot) {
          int totalCalories = snapshot.data ?? 0;
          return FutureBuilder<Map<String, dynamic>>(
              future: _fetchAccumulatedWorkoutDataForToday(),
              builder: (context, exerciseSnapshot) {
                int totalExercise =
                    exerciseSnapshot.data?['totalCalories'] ?? 0;
                int baseGoal = 2000;

                int remaining = baseGoal - totalCalories + totalExercise;
                return Container(
                  margin: EdgeInsets.only(
                    left: 36.h,
                    right: 41.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 30.v,
                  ),
                  decoration: AppDecoration.fillGray800931.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Calories",
                        style: CustomTextStyles.titleLarge20,
                      ),
                      Text(
                        "Remaining = Goal - Food + Exercise",
                        style: CustomTextStyles.labelLargeGray600,
                      ),
                      SizedBox(height: 10.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 22.h,
                            right: 3.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30.h,
                                  vertical: 50.v,
                                ),
                                decoration:
                                    AppDecoration.outlineBluegray9001.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder56,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      remaining.toString(),
                                      style: CustomTextStyles.titleLarge20,
                                    ),
                                    Text(
                                      "Remaining",
                                      style:
                                          CustomTextStyles.labelMediumWhiteA700,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 13.v),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              ImageConstant.imgSettingsGray300,
                                          height: 30.adaptSize,
                                          width: 30.adaptSize,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 4.v),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Base Goal",
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                "2000",
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.v),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              ImageConstant.imgSettingsPrimary,
                                          height: 30.adaptSize,
                                          width: 30.adaptSize,
                                          margin: EdgeInsets.only(
                                            top: 7.v,
                                            bottom: 5.v,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Food",
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                              Text(
                                                totalCalories.toString(),
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.v),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgFire,
                                          height: 30.adaptSize,
                                          width: 30.adaptSize,
                                          margin: EdgeInsets.only(
                                            top: 7.v,
                                            bottom: 5.v,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.h),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Exercise",
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                                FutureBuilder<
                                                        Map<String, dynamic>>(
                                                    future:
                                                        _fetchAccumulatedWorkoutDataForToday(),
                                                    builder:
                                                        (context, snapshot) {
                                                      int totalExercise = snapshot
                                                                  .data?[
                                                              'totalCalories'] ??
                                                          0;
                                                      return Text(
                                                        totalExercise
                                                            .toString(),
                                                        style: theme.textTheme
                                                            .bodyLarge,
                                                      );
                                                    })
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  /// Section Widget
  Widget _buildStepsRow(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          _fetchAccumulatedWorkoutDataForToday(),
          _fetchAccumulatedStepsForToday(),
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          int steps = snapshot.data?[1] ?? 0;
          int totalCalories = snapshot.data?[0]['totalCalories'] ?? 0;
          int totalDuration = snapshot.data?[0]['totalDuration'] ?? 0;

          print(snapshot.data);
          return Padding(
            padding: EdgeInsets.only(
              left: 36.h,
              right: 41.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 7.v,
                  ),
                  decoration: AppDecoration.fillGray800931.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 124.h,
                          margin: EdgeInsets.only(left: 14.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 45.v,
                                width: 30.h,
                                margin: EdgeInsets.only(top: 3.v),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Steps",
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5.h),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.stepsScreen,
                                    );
                                  },
                                  child: Text(
                                    "+",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 6.v),
                      Padding(
                        padding: EdgeInsets.only(left: 14.h),
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgUser,
                              height: 30.adaptSize,
                              width: 30.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 8.h,
                                bottom: 3.v,
                              ),
                              child: Text(
                                steps.toString(),
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.v),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.h,
                    vertical: 7.v,
                  ),
                  decoration: AppDecoration.fillGray800931.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 125.h,
                          height: 45.v,
                          margin: EdgeInsets.only(left: 7.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 2.v,
                                  bottom: 1.v,
                                ),
                                child: Text(
                                  "Exercise",
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5.h),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes
                                          .workoutCategoriesTabContainerScreen,
                                    );
                                  },
                                  child: Text(
                                    "+",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 6.v),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgFire,
                              height: 15.adaptSize,
                              width: 15.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 9.h),
                              child: Text(
                                '$totalCalories kcal',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6.v),
                      Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgUserIndigoA40001,
                              height: 15.adaptSize,
                              width: 15.adaptSize,
                              margin: EdgeInsets.only(top: 1.v),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text(
                                '$totalDuration min',
                                style: CustomTextStyles.bodyLarge17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.v),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
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
