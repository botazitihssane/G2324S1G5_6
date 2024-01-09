import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<QueryDocumentSnapshot>? categories;
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
                      _buildTabView(context),
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
  Widget _buildTabView(BuildContext context) {
    double tabWidth = 150.0;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Text("No data available");
        }

        categories = snapshot.data!.docs;

        return Expanded(
          child: Column(
            children: [
              _buildTabBar(),
              Expanded(
                child: TabBarView(
                  controller: tabviewController,
                  children: _buildTabContents(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 40.v,
      width: 300.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(14.h),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.black90001,
        labelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: appTheme.whiteA700,
        unselectedLabelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(8.h),
        ),
        tabs: _buildTabs(),
      ),
    );
  }

  List<Widget> _buildTabs() {
    return categories!.map((category) {
      return Tab(
        child: Container(
          width: 150.0,
          child: Center(
            child: Text(category['nom']),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildTabContents() {
    return categories!.map((category) {
      return WorkoutCategoriesPage(categoryId: category.id);
    }).toList();
  }
}
