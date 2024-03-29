import 'package:flutter/material.dart';
import 'package:wotkout_app/model/food.dart';
import 'package:wotkout_app/model/user.dart';
import 'package:wotkout_app/presentation/age_page_screen/age_page_screen.dart';
import 'package:wotkout_app/presentation/gender_page_screen/gender_page_screen.dart';
import 'package:wotkout_app/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:wotkout_app/presentation/weight_page_screen/weight_page_screen.dart';
import 'package:wotkout_app/presentation/height_page_screen/height_page_screen.dart';
import 'package:wotkout_app/presentation/loading_screen/loading_screen.dart';
import 'package:wotkout_app/presentation/first_page_screen/first_page_screen.dart';
import 'package:wotkout_app/presentation/goal_page_screen/goal_page_screen.dart';
import 'package:wotkout_app/presentation/physical_activity_screen/physical_activity_screen.dart';
import 'package:wotkout_app/presentation/saving_page_screen/saving_page_screen.dart';
import 'package:wotkout_app/presentation/water_screen/water_screen.dart';
import 'package:wotkout_app/presentation/food_log_container_screen/food_log_container_screen.dart';
import 'package:wotkout_app/presentation/steps_screen/steps_screen.dart';
import 'package:wotkout_app/presentation/add_steps_screen/add_steps_screen.dart';
import 'package:wotkout_app/presentation/view_food_screen/view_food_screen.dart';
import 'package:wotkout_app/presentation/search_food_screen/search_food_screen.dart';
import 'package:wotkout_app/presentation/modify_profil_screen/modify_profil_screen.dart';
import 'package:wotkout_app/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:wotkout_app/presentation/add_food_screen/add_food_screen.dart';
import 'package:wotkout_app/presentation/add_food_2_screen/add_food_2_screen.dart';
import 'package:wotkout_app/presentation/add_food_three_screen/add_food_three_screen.dart';
import 'package:wotkout_app/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:wotkout_app/presentation/workout_home_screen/workout_home_screen.dart';
import 'package:wotkout_app/presentation/begin_workout_screen/begin_workout_screen.dart';
import 'package:wotkout_app/presentation/view_my_workout_tab_container_screen/view_my_workout_tab_container_screen.dart';
import 'package:wotkout_app/presentation/workout_categories_tab_container_screen/workout_categories_tab_container_screen.dart';
import 'package:wotkout_app/presentation/do_a_workout_screen/do_a_workout_screen.dart';
import 'package:wotkout_app/presentation/save_session_screen/save_session_screen.dart';
import 'package:wotkout_app/presentation/start_workout_warm_up_screen/start_workout_warm_up_screen.dart';
import 'package:wotkout_app/presentation/start_workout_chest_screen/start_workout_chest_screen.dart';
import 'package:wotkout_app/presentation/start_workout_back_screen/start_workout_back_screen.dart';
import 'package:wotkout_app/presentation/start_workout_shoulder_screen/start_workout_shoulder_screen.dart';
import 'package:wotkout_app/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String agePageScreen = '/age_page_screen';

  static const String genderPageScreen = '/gender_page_screen';

  static const String weightPageScreen = '/weight_page_screen';

  static const String heightPageScreen = '/height_page_screen';

  static const String loadingScreen = '/loading_screen';

  static const String firstPageScreen = '/first_page_screen';

  static const String goalPageScreen = '/goal_page_screen';

  static const String physicalActivityScreen = '/physical_activity_screen';

  static const String savingPageScreen = '/saving_page_screen';

  static const String waterScreen = '/water_screen';

  static const String foodLogPage = '/food_log_page';

  static const String foodLogContainerScreen = '/food_log_container_screen';

  static const String stepsScreen = '/steps_screen';

  static const String addStepsScreen = '/add_steps_screen';

  static const String viewFoodScreen = '/view_food_screen';

  static const String searchFoodScreen = '/search_food_screen';

  static const String modifyProfilScreen = '/modify_profil_screen';

  static const String dashboardScreen = '/dashboard_screen';

  static const String addFoodScreen = '/add_food_screen';

  static const String addFood2Screen = '/add_food_2_screen';

  static const String addFoodThreeScreen = '/add_food_three_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String signUpScreen = '/sign_un_screen';

  static const String workoutHomeScreen = '/workout_home_screen';

  static const String beginWorkoutScreen = '/begin_workout_screen';

  static const String viewMyWorkoutPage = '/view_my_workout_page';

  static const String viewMyWorkoutTabContainerScreen =
      '/view_my_workout_tab_container_screen';

  static const String workoutCategoriesPage = '/workout_categories_page';

  static const String workoutCategoriesTabContainerScreen =
      '/workout_categories_tab_container_screen';

  static const String doAWorkoutScreen = '/do_a_workout_screen';

  static const String saveSessionScreen = '/save_session_screen';

  static const String startWorkoutWarmUpScreen =
      '/start_workout_warm_up_screen';

  static const String startWorkoutChestScreen = '/start_workout_chest_screen';

  static const String startWorkoutBackScreen = '/start_workout_back_screen';

  static const String startWorkoutShoulderScreen =
      '/start_workout_shoulder_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Widget ageScreen(BuildContext context) {
    return AgePageScreen(
      user: ModalRoute.of(context)!.settings.arguments as CustomUser,
    );
  }

  static Widget genderScreen(BuildContext context) {
    return GenderPageScreen(
      user: ModalRoute.of(context)!.settings.arguments as CustomUser,
    );
  }

  static Widget heightScreen(BuildContext context) {
    return HeightPageScreen(
      user: ModalRoute.of(context)!.settings.arguments as CustomUser,
    );
  }

  static Widget weightScreen(BuildContext context) {
    return WeightPageScreen(
      user: ModalRoute.of(context)!.settings.arguments as CustomUser,
    );
  }

  static Widget goalScreen(BuildContext context) {
    return GoalPageScreen(
      user: ModalRoute.of(context)!.settings.arguments as CustomUser,
    );
  }

  static Widget PhysicalActivityPage(BuildContext context) {
    return PhysicalActivityScreen(
      user: ModalRoute.of(context)!.settings.arguments as CustomUser,
    );
  }

  static Widget SavingPage(BuildContext context) {
    return SavingPageScreen(
      user: ModalRoute.of(context)!.settings.arguments as CustomUser,
    );
  }

  static Widget addFood2Page(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Food;

    return AddFood2Screen(foodData: arguments);
  }

  static Widget searchFoodPage(BuildContext context) {
    return SearchFoodScreen();
  }

  static Widget startWorkoutChest(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return StartWorkoutChestScreen(
      catId: arguments['catId'],
      docId: arguments['docId'],
    );
  }

  static Widget saveSessionPage(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return SaveSessionScreen(
        email: arguments['email'],
        titre: arguments['titre'],
        calories: arguments['calories'],
        duree: arguments['duree'],
        docId: arguments['docId'],
        catId: arguments['catId'],
        photo: arguments['photo']);
  }

  static Map<String, WidgetBuilder> routes = {
    agePageScreen: (context) => ageScreen(context),
    genderPageScreen: (context) => genderScreen(context),
    heightPageScreen: (context) => heightScreen(context),
    weightPageScreen: (context) => weightScreen(context),
    loadingScreen: (context) => LoadingScreen(),
    firstPageScreen: (context) => FirstPageScreen(),
    goalPageScreen: (context) => goalScreen(context),
    physicalActivityScreen: (context) => PhysicalActivityPage(context),
    savingPageScreen: (context) => SavingPage(context),
    waterScreen: (context) => WaterScreen(),
    foodLogContainerScreen: (context) => FoodLogContainerScreen(),
    stepsScreen: (context) => StepsScreen(),
    addStepsScreen: (context) => AddStepsScreen(),
    viewFoodScreen: (context) => ViewFoodScreen(),
    searchFoodScreen: (context) => searchFoodPage(context),
    modifyProfilScreen: (context) => ModifyProfilScreen(),
    dashboardScreen: (context) => DashboardScreen(),
    addFoodScreen: (context) => AddFoodScreen(),
    addFood2Screen: (context) => addFood2Page(context),
    addFoodThreeScreen: (context) => AddFoodThreeScreen(),
    signInScreen: (context) => SignInScreen(),
    signUpScreen: (context) => SignUpScreen(),
    workoutHomeScreen: (context) => WorkoutHomeScreen(),
    beginWorkoutScreen: (context) => BeginWorkoutScreen(),
    viewMyWorkoutTabContainerScreen: (context) =>
        ViewMyWorkoutTabContainerScreen(),
    workoutCategoriesTabContainerScreen: (context) =>
        WorkoutCategoriesTabContainerScreen(),
    doAWorkoutScreen: (context) => DoAWorkoutScreen(),
    saveSessionScreen: (context) => saveSessionPage(context),
    startWorkoutWarmUpScreen: (context) => StartWorkoutWarmUpScreen(),
    startWorkoutChestScreen: (context) => startWorkoutChest(context),
    startWorkoutBackScreen: (context) => StartWorkoutBackScreen(),
    startWorkoutShoulderScreen: (context) => StartWorkoutShoulderScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
