import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Age Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.agePageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Gender Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.genderPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Weight Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.weightPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Height Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.heightPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Loading",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.loadingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "First page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.firstPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Goal Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.goalPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Physical Activity",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.physicalActivityScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Saving page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.savingPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Water",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.waterScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Food log - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.foodLogContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Steps",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.stepsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add steps",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addStepsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "View food",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.viewFoodScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search food",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.searchFoodScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Modify Profil",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.modifyProfilScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Dashboard",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.dashboardScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add food",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addFoodScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add food - 2 ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addFood2Screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add food - Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addFoodThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign in",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signInScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Workout Home",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.workoutHomeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Begin workout",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.beginWorkoutScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "View My Workout - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.viewMyWorkoutTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Workout categories - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.workoutCategoriesTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Do a workout",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.doAWorkoutScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Save session",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.saveSessionScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Start workout - Warm up",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.startWorkoutWarmUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Start workout - Chest",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.startWorkoutChestScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Start workout - Back",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.startWorkoutBackScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Start workout - shoulder",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.startWorkoutShoulderScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
