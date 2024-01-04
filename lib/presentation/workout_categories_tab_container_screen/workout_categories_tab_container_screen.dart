import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/presentation/workout_categories_page/workout_categories_page.dart';

class WorkoutCategoriesTabContainerScreen extends StatefulWidget {
  const WorkoutCategoriesTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  WorkoutCategoriesTabContainerScreenState createState() =>
      WorkoutCategoriesTabContainerScreenState();
}

class WorkoutCategoriesTabContainerScreenState
    extends State<WorkoutCategoriesTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 23.v),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Text(
                        "Workout Categories",
                        style: CustomTextStyles.titleLargeOpenSans,
                      ),
                      SizedBox(height: 28.v),
                      _buildTabview(context),
                      Expanded(
                        child: SizedBox(
                          height: 743.v,
                          child: TabBarView(
                            controller: tabviewController,
                            children: [
                              WorkoutCategoriesPage(),
                              WorkoutCategoriesPage(),
                              WorkoutCategoriesPage(),
                            ],
                          ),
                        ),
                      ),
                    ],
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
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 28.v,
      width: 327.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          14.h,
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.black90001,
        labelStyle: TextStyle(
          fontSize: 13.fSize,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: appTheme.whiteA700,
        unselectedLabelStyle: TextStyle(
          fontSize: 13.fSize,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            14.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "Beginner",
            ),
          ),
          Tab(
            child: Text(
              "Intermediate",
            ),
          ),
          Tab(
            child: Text(
              "Advance",
            ),
          ),
        ],
      ),
    );
  }
}
