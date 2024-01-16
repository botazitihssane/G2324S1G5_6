import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/presentation/food_log_page/food_log_page.dart';
import 'package:wotkout_app/presentation/view_my_workout_page/view_my_workout_page.dart';
import 'package:wotkout_app/widgets/custom_bottom_bar.dart';
import 'package:wotkout_app/widgets/custom_icon_button.dart';

class ViewMyWorkoutTabContainerScreen extends StatefulWidget {
  const ViewMyWorkoutTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ViewMyWorkoutTabContainerScreenState createState() =>
      ViewMyWorkoutTabContainerScreenState();
}

class ViewMyWorkoutTabContainerScreenState
    extends State<ViewMyWorkoutTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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
              SizedBox(height: 32.v),
              _buildWorkoutRow(context),
              SizedBox(height: 17.v),
              Expanded(
                child: SizedBox(
                  height: 639.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      ViewMyWorkoutPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildWorkoutRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 2.v,
              bottom: 3.v,
            ),
            child: Text(
              "My Workouts",
              style: CustomTextStyles.headlineMediumSFProPrimary,
            ),
          ),
          CustomIconButton(
            height: 40.adaptSize,
            width: 40.adaptSize,
            padding: EdgeInsets.all(8.h),
            decoration: IconButtonStyleHelper.fillWhiteA,
            child: CustomImageView(
              imagePath: ImageConstant.imgSearch,
            ),
          ),
        ],
      ),
    );
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
