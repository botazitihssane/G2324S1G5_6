import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/presentation/start_workout_chest_screen/exercices.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';

class StartWorkoutChestScreen extends StatelessWidget {
  StartWorkoutChestScreen({Key? key})
      : super(
          key: key,
        );

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchWorkoutData() async {
    String collectionName = 'exercices';
    String documentId = 'Q4hBKs5tsJegpI4k4lnj';

    return await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(documentId)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
          future: fetchWorkoutData(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return Text('No data available');
            }

            final exercice workoutData = exercice(
                title: snapshot.data!['titre'],
                description: snapshot.data!['description'],
                duration: snapshot.data!['duree'],
                calories: snapshot.data!['calories'],
                soustitre: snapshot.data!['soustitre']);

            return Column(
              children: [
                _buildStackOne(context),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStackTwo(context, workoutData),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackOne(BuildContext context) {
    return SizedBox(
      height: 269.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage71,
            height: 269.v,
            width: 393.h,
            alignment: Alignment.center,
          ),
          CustomAppBar(
            height: 47.v,
            leadingWidth: double.maxFinite,
            leading: AppbarLeadingIconbutton(
              imagePath: ImageConstant.imgPath,
              margin: EdgeInsets.only(
                left: 15.h,
                right: 346.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStackTwo(BuildContext context, exercice workoutData) {
    return SizedBox(
      height: 604.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 32.h,
                vertical: 48.v,
              ),
              decoration: AppDecoration.fillOnPrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL32,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 277.v,
                      width: 307.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 87.v),
                              child: Row(
                                children: [
                                  CustomTextFormField(
                                    width: 86.h,
                                    controller: TextEditingController(
                                        text: "${workoutData.duration} min"),
                                    hintText: "50 min",
                                    prefix: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          5.h, 5.v, 6.h, 5.v),
                                      child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgOverflowmenu,
                                        height: 19.adaptSize,
                                        width: 19.adaptSize,
                                      ),
                                    ),
                                    prefixConstraints: BoxConstraints(
                                      maxHeight: 29.v,
                                    ),
                                    contentPadding: EdgeInsets.only(
                                      top: 5.v,
                                      right: 14.h,
                                      bottom: 5.v,
                                    ),
                                    borderDecoration: TextFormFieldStyleHelper
                                        .fillPrimaryContainer,
                                    fillColor:
                                        theme.colorScheme.primaryContainer,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 17.h),
                                    child: CustomTextFormField(
                                      width: 89.h,
                                      controller: TextEditingController(
                                          text: "${workoutData.calories} Cal"),
                                      hintText: "700 Cal",
                                      textInputAction: TextInputAction.done,
                                      prefix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            5.h, 5.v, 6.h, 5.v),
                                        child: CustomImageView(
                                          imagePath:
                                              ImageConstant.imgFireWhiteA700,
                                          height: 19.adaptSize,
                                          width: 19.adaptSize,
                                        ),
                                      ),
                                      prefixConstraints: BoxConstraints(
                                        maxHeight: 29.v,
                                      ),
                                      contentPadding: EdgeInsets.only(
                                        top: 5.v,
                                        right: 14.h,
                                        bottom: 5.v,
                                      ),
                                      borderDecoration: TextFormFieldStyleHelper
                                          .fillPrimaryContainer,
                                      fillColor:
                                          theme.colorScheme.primaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  workoutData.title,
                                  style: CustomTextStyles.titleLargeOpenSans,
                                ),
                                SizedBox(height: 8.v),
                                Text(
                                  workoutData.soustitre,
                                  style: theme.textTheme.bodyMedium,
                                ),
                                SizedBox(height: 95.v),
                                SizedBox(
                                  width: 307.h,
                                  child: Text(
                                    workoutData.description,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 11.v),
                  Padding(
                    padding: EdgeInsets.only(right: 1.h),
                    child: _buildRowOne(context),
                  ),
                  SizedBox(height: 16.v),
                  Padding(
                    padding: EdgeInsets.only(right: 1.h),
                    child: _buildRowOne(context),
                  ),
                  SizedBox(height: 42.v),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 46.h,
                vertical: 23.v,
              ),
              decoration:
                  AppDecoration.gradientOnErrorContainerToOnErrorContainer1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 98.v),
                  CustomElevatedButton(
                    height: 52.v,
                    text: "Start Workout",
                    margin: EdgeInsets.only(right: 15.h),
                    buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                    buttonTextStyle:
                        CustomTextStyles.titleMediumOpenSansBlack90001,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRowOne(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage4,
            height: 76.v,
            width: 82.h,
            radius: BorderRadius.horizontal(
              left: Radius.circular(12.h),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 9.v,
              bottom: 9.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 122.h,
                  child: Text(
                    "Stability Training Basics",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleSmallOpenSans.copyWith(
                      height: 1.20,
                    ),
                  ),
                ),
                SizedBox(height: 2.v),
                Text(
                  "0:30",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowDown,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(
              top: 26.v,
              right: 16.h,
              bottom: 26.v,
            ),
          ),
        ],
      ),
    );
  }
}
