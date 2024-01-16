import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_icon_button.dart';

class SaveSessionScreen extends StatefulWidget {
  final String email;
  final String titre;
  final int calories;
  final int duree;
  final String docId;
  final String catId;
  final String photo;

  const SaveSessionScreen({
    Key? key,
    required this.email,
    required this.titre,
    required this.calories,
    required this.duree,
    required this.docId,
    required this.catId,
    required this.photo,
  }) : super(key: key);

  @override
  _SaveSessionScreenState createState() => _SaveSessionScreenState();
}

class _SaveSessionScreenState extends State<SaveSessionScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Future<DocumentSnapshot<Map<String, dynamic>>> _userTop;

  late int bestCalories;
  late int bestTime;
  late String topWorkoutDocId;

  @override
  void initState() {
    super.initState();
    _userTop = _fetchUserTopWorkout();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _fetchUserTopWorkout() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: widget.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String userId = querySnapshot.docs.first.id;

        QuerySnapshot workoutSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('workout')
            .limit(1)
            .get();

        if (workoutSnapshot.docs.isNotEmpty) {
          setState(() {
            topWorkoutDocId = workoutSnapshot.docs.first.id;
            bestCalories = workoutSnapshot.docs.first['bestCalories'] ?? 0;
            bestTime = workoutSnapshot.docs.first['bestTime'] ?? 0;
          });
        } else {
          setState(() {
            bestCalories = 0;
            bestTime = 0;
          });
        }

        return Future.value(null);
      }

      return Future.value(null);
    } catch (error) {
      print("Error fetching user top workout: $error");
      return Future.value(null);
    }
  }

  void _storeBestWorkout(biggerCalories, biggerTime) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(topWorkoutDocId)
          .collection('workout')
          .doc()
          .set({
        'bestCalories': biggerCalories,
        'bestTime': biggerTime,
      });

      print('Best workout stored successfully.');
    } catch (error) {
      print('Error storing best workout: $error');
    }
  }

  void _storeWorkoutHistory() async {
    try {
      await FirebaseFirestore.instance.collection('workoutHistory').add({
        'email': widget.email,
        'titre': widget.titre,
        'date': DateTime.now(),
        'calories': widget.calories,
        'duree': widget.duree,
        'docId': widget.docId,
        'catId': widget.catId,
        'photo': widget.photo
      });

      print('Workout history stored successfully.');
    } catch (error) {
      print('Error storing workout history: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildTopNavigation(context),
                  SizedBox(height: 80.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(right: 25.h),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.all(0),
                                        child: Text("Great Job!",
                                            style: theme
                                                .textTheme.headlineMedium)),
                                    Padding(
                                        padding: EdgeInsets.all(0),
                                        child: Text(
                                            "You’ve completed your workout",
                                            style: CustomTextStyles
                                                .bodyLargeNewYork)),
                                    SizedBox(height: 49.v),
                                    _buildSummary(context),
                                    SizedBox(height: 31.v),
                                    _buildSummary1(context),
                                    SizedBox(height: 126.v),
                                    CustomElevatedButton(
                                        text: "Save Session",
                                        margin: EdgeInsets.only(left: 24.h),
                                        buttonStyle:
                                            CustomButtonStyles.fillPrimaryTL14,
                                        buttonTextStyle: CustomTextStyles
                                            .titleMediumSFProTextBlack90001,
                                        onPressed: () {
                                          _storeWorkoutHistory();
                                          Navigator.pushNamed(
                                              context,
                                              AppRoutes
                                                  .workoutCategoriesTabContainerScreen);
                                        }),
                                    SizedBox(height: 491.v),
                                  ]))))
                ]))));
  }

  /// Section Widget
  Widget _buildTopNavigation(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 14.v),
        decoration: AppDecoration.outlineGrayB,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 7.v),
              CustomAppBar(
                  height: 24.v,
                  leadingWidth: 25.h,
                  leading: AppbarLeadingImage(
                      imagePath: ImageConstant.imgArrowLeftWhiteA70024x18,
                      margin: EdgeInsets.only(left: 7.h),
                      onTap: () {
                        onTapArrowLeft(context);
                      }),
                  title: AppbarSubtitleFour(
                      text: "Back", margin: EdgeInsets.only(left: 5.h)),
                  actions: [
                    AppbarSubtitleThree(
                        text: "Exit",
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 1.v))
                  ]),
              SizedBox(height: 11.v),
              Padding(
                  padding: EdgeInsets.all(0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Save Session",
                            style: theme.textTheme.displaySmall)
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildSummary(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
              padding: EdgeInsets.only(left: 21.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Summary", style: CustomTextStyles.titleMediumSFProText),
              ])),
          SizedBox(height: 20.v),
          Padding(
              padding: EdgeInsets.only(left: 50.h, right: 29.h),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Column(children: [
                  SizedBox(
                      height: 58.adaptSize,
                      width: 58.adaptSize,
                      child: Stack(alignment: Alignment.center, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgUiIconsFlameFill,
                            height: 29.adaptSize,
                            width: 29.adaptSize,
                            alignment: Alignment.center),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 58.adaptSize,
                                width: 58.adaptSize,
                                decoration: BoxDecoration(
                                    color:
                                        appTheme.deepOrange500.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(29.h))))
                      ])),
                  SizedBox(height: 10.v),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: widget.calories.toString(),
                            style: CustomTextStyles
                                .titleMediumSFProTextDeeporange500SemiBold),
                        TextSpan(
                            text: "kcal",
                            style:
                                CustomTextStyles.titleMediumSFProTextSemiBold)
                      ]),
                      textAlign: TextAlign.left),
                  Text("Burned", style: theme.textTheme.bodyLarge)
                ]),
                Spacer(flex: 47),
                Column(children: [
                  CustomIconButton(
                      height: 58.adaptSize,
                      width: 58.adaptSize,
                      padding: EdgeInsets.all(11.h),
                      decoration: IconButtonStyleHelper.fillLightBlue,
                      child: CustomImageView(imagePath: ImageConstant.imgIcon)),
                  SizedBox(height: 11.v),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "1606",
                            style: CustomTextStyles
                                .titleMediumSFProTextLightblue200),
                        TextSpan(text: " "),
                        TextSpan(
                            text: "kg",
                            style:
                                CustomTextStyles.titleMediumSFProTextSemiBold)
                      ]),
                      textAlign: TextAlign.left),
                  Text("Lifted", style: theme.textTheme.bodyLarge)
                ]),
                Spacer(flex: 52),
                _buildTime(context,
                    timeText: widget.duree.toString(), trainedText: "Trained")
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildSummary1(BuildContext context) {
    int biggerCalories =
        bestCalories > widget.calories ? bestCalories : widget.calories;
    int biggerTime = bestTime > widget.duree ? bestTime : widget.duree;

    _storeBestWorkout(biggerCalories, biggerTime);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Personal Records",
              style: CustomTextStyles.titleMediumSFProText),
          SizedBox(height: 25.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(right: 120.v),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(children: [
                      CustomIconButton(
                          height: 58.adaptSize,
                          width: 58.adaptSize,
                          padding: EdgeInsets.all(11.h),
                          decoration: IconButtonStyleHelper.fillDeepOrange,
                          child: CustomImageView(
                              imagePath: ImageConstant.imgTicket)),
                      SizedBox(height: 10.v),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "$biggerCalories ",
                                style: CustomTextStyles
                                    .titleMediumSFProTextDeeporange500SemiBold),
                            TextSpan(
                                text: "kcal",
                                style: CustomTextStyles
                                    .titleMediumSFProTextSemiBold)
                          ]),
                          textAlign: TextAlign.left),
                      Text("Burned", style: theme.textTheme.bodyLarge)
                    ]),
                    Padding(
                        padding: EdgeInsets.only(left: 60.h),
                        child: _buildTime(context,
                            timeText: "$biggerTime min",
                            trainedText: "Trained"))
                  ])))
        ]));
  }

  /// Common widget
  Widget _buildTime(
    BuildContext context, {
    required String timeText,
    required String trainedText,
  }) {
    return Column(children: [
      CustomIconButton(
          height: 58.adaptSize,
          width: 58.adaptSize,
          padding: EdgeInsets.all(11.h),
          child: CustomImageView(imagePath: ImageConstant.imgClock)),
      SizedBox(height: 10.v),
      Text(timeText,
          style: CustomTextStyles.titleMediumSFProTextSemiBold_1
              .copyWith(color: appTheme.whiteA700)),
      SizedBox(height: 1.v),
      Text(trainedText,
          style: theme.textTheme.bodyLarge!.copyWith(color: appTheme.whiteA700))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
