import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wotkout_app/model/workoutHistory.dart';

import '../view_my_workout_page/widgets/category_item_widget.dart';
import '../view_my_workout_page/widgets/workoutcard_item_widget.dart';
import '../view_my_workout_page/widgets/workoutcomponent_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class ViewMyWorkoutPage extends StatefulWidget {
  const ViewMyWorkoutPage({Key? key})
      : super(
          key: key,
        );

  @override
  ViewMyWorkoutPageState createState() => ViewMyWorkoutPageState();
}

class ViewMyWorkoutPageState extends State<ViewMyWorkoutPage>
    with AutomaticKeepAliveClientMixin<ViewMyWorkoutPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  Future<List<Map<String, dynamic>>> getWorkoutHistory() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('workoutHistory')
          .where('email', isEqualTo: _user?.email)
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print("Error fetching workout history: $e");
      return [];
    }
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 8.v),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.v),
                    _buildWorkoutCard(context),
                    SizedBox(height: 14.v),
                    _buildViewAllButton(context),
                    SizedBox(height: 12.v),
                    Padding(
                      padding: EdgeInsets.only(left: 18.h),
                      child: Text(
                        "Latest Activity",
                        style: CustomTextStyles.titleLargeInter,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    _buildWorkoutComponentStack(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWorkoutCard(BuildContext context) {
    List<Map<String, String>> workoutDataList = [
      {
        'title': 'Belly fat burner for Beginner',
        'duration': '20 Min',
        'calories': '432 Kcal',
        'photo': ImageConstant.imgFrame29
      },
      {
        'title': 'Full Body HIIT Workout',
        'duration': '15 Min',
        'calories': '300 Kcal',
        'photo': ImageConstant.imgFrame29
      },
      {
        'title': 'Yoga for Flexibility',
        'duration': '30 Min',
        'calories': '150 Kcal',
        'photo': ImageConstant.imgFrame29
      },
    ];

    return SizedBox(
      height: 152.v,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 7.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 12.h,
          );
        },
        itemCount: workoutDataList.length,
        itemBuilder: (context, index) {
          return WorkoutcardItemWidget(
            title: workoutDataList[index]['title'] ?? '',
            duration: workoutDataList[index]['duration'] ?? '',
            calories: workoutDataList[index]['calories'] ?? '',
            photo: workoutDataList[index]['photo'] ?? '',
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildViewAllButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "View All",
      margin: EdgeInsets.only(
        left: 7.h,
        right: 35.h,
      ),
      buttonStyle: CustomButtonStyles.outlineSecondaryContainer,
      buttonTextStyle: CustomTextStyles.titleMediumSFProPrimary,
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoutes.workoutCategoriesTabContainerScreen,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildWorkoutComponentStack(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 5.h),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('workoutHistory')
              .where('email', isEqualTo: _user?.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return Text("No data available");
            }

            var workoutHistory = snapshot.data!.docs;
            List<Map<String, dynamic>> workoutList = workoutHistory
                .map((workout) => {
                      'docId': workout.id,
                      ...workout.data()!,
                    })
                .toList();

            print(workoutHistory.length);

            return Container(
              margin: EdgeInsets.only(left: 23.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 6.v),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: workoutList.length,
                        itemBuilder: (context, index) {
                          print(workoutList.length);
                          return WorkoutcomponentItemWidget(
                            workoutData:
                                WorkoutHistory.fromMap(workoutList[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
