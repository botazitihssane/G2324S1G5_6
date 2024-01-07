import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/food.dart';
import 'package:intl/intl.dart';

class AddFood2Screen extends StatefulWidget {
  final Food? foodData;

  const AddFood2Screen({Key? key, required this.foodData}) : super(key: key);

  @override
  _AddFood2ScreenState createState() => _AddFood2ScreenState();
}

class _AddFood2ScreenState extends State<AddFood2Screen> {
  late TextEditingController servingsController;
  int numberOfServings = 1;
  String selectedMeal = 'breakfast';
  bool isMealDropdownVisible = false;
  bool isAddingData = false;

  @override
  void initState() {
    super.initState();
    servingsController =
        TextEditingController(text: numberOfServings.toString());
  }

  @override
  void dispose() {
    servingsController.dispose();
    super.dispose();
  }

  void onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> addFoodLogToFirestore() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      String userEmail = user.email ?? '';

      try {
        CollectionReference dailyFoodLogCollection =
            FirebaseFirestore.instance.collection('dailyFoodLog');

        QuerySnapshot existingLogs = await dailyFoodLogCollection
            .where('user', isEqualTo: userEmail)
            .where('date',
                isEqualTo: DateFormat('yyyy-MM-dd').format(DateTime.now()))
            .get();

        Map<String, dynamic>? existingData =
            existingLogs.docs[0].data() as Map<String, dynamic>?;

        bool totalCaloriesExists =
            existingData != null && existingData.containsKey('totalCalories');

        num totalCalories =
            totalCaloriesExists ? existingData!['totalCalories'] : 0;

        totalCalories += (widget.foodData?.calories ?? 0) * numberOfServings;

        if (totalCaloriesExists) {
          await existingLogs.docs[0].reference.update({
            'totalCalories': totalCalories,
          });
        } else {
          await existingLogs.docs[0].reference.set(
            {
              'totalCalories': totalCalories,
            },
            SetOptions(merge: true),
          );
        }

        if (existingLogs.docs.isEmpty) {
          DocumentReference foodLogDocRef = await dailyFoodLogCollection.add({
            'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
            'user': userEmail,
            'totalCaloris': totalCalories
          });

          CollectionReference mealSubcollection =
              foodLogDocRef.collection(selectedMeal);

          await mealSubcollection.add({
            'food': widget.foodData?.foodName,
            'calories': (widget.foodData?.calories ?? 0) * numberOfServings,
          });
        } else {
          DocumentReference existingDocRef =
              existingLogs.docs[0].reference.collection(selectedMeal).doc();

          await existingDocRef.set({
            'food': widget.foodData?.foodName,
            'calories': (widget.foodData?.calories ?? 0) * numberOfServings,
          });
        }

        print('Food log added successfully!');
      } catch (error) {
        print('Error adding food log: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Display circular progress indicator while waiting for the future
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              // Your existing UI code
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(height: 33.v),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 11.v),
                      decoration: AppDecoration.fillGray80093.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildArrowLeftRow(context),
                          SizedBox(height: 32.v),
                          _buildComponentNineColumn(context),
                          _buildLineFifteenStack1(context),
                          _buildServingSizeColumn(context),
                          _buildMealOptionColumn(context),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildArrowLeftRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.h, right: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeftWhiteA70013x13,
            height: 13.adaptSize,
            width: 13.adaptSize,
            margin: EdgeInsets.only(top: 9.v, bottom: 5.v),
            onTap: () {
              onTapImgArrowLeft(context);
            },
          ),
          Text("Add food", style: CustomTextStyles.titleLargePrimary_1),
          TextButton(
            onPressed: () {
              onTapImgCheckmark(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgCheckmark,
              height: 9.v,
              width: 13.h,
              margin: EdgeInsets.only(top: 13.v, bottom: 4.v),
            ),
          ),
        ],
      ),
    );
  }

  void onTapImgCheckmark(BuildContext context) async {
    setState(() {
      isAddingData = true;
    });

    try {
      await addFoodLogToFirestore();
      print('Food log added successfully!');
    } catch (error) {
      print('Error adding food log: $error');
    } finally {
      setState(() {
        isAddingData = false;
      });
    }

    Navigator.pop(context);
  }

  Widget _buildComponentNineColumn(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: AppDecoration.fillGray800931,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              SizedBox(height: 10.v),
              Padding(
                padding: EdgeInsets.only(left: 25.h),
                child: Text('${widget.foodData?.foodName}',
                    style: theme.textTheme.labelLarge),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLineFifteenStack1(BuildContext context) {
    return SizedBox(
      height: 40.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: AppDecoration.fillGray800931,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLineFifteenStack(context),
                  SizedBox(height: 7.v),
                  Padding(
                    padding: EdgeInsets.only(left: 25.h, right: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 6.v, bottom: 4.v),
                          child: Text("Serving size",
                              style: theme.textTheme.bodySmall),
                        ),
                        Container(
                          height: 25.v,
                          width: 60.h,
                          decoration: BoxDecoration(
                            color: appTheme.gray80093,
                            borderRadius: BorderRadius.circular(2.h),
                            border: Border.all(
                                color: appTheme.blueGray100, width: 2.h),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7.v),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 25.h, bottom: 10.v),
              child: Text('${widget.foodData?.servingSize}',
                  style: CustomTextStyles.bodyMediumInikaWhiteA700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServingSizeColumn(BuildContext context) {
    return Container(
      height: 40.v,
      decoration: AppDecoration.fillGray800931,
      child: Column(
        children: [
          _buildLineFifteenStack(context),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 25.h, right: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6.v, bottom: 4.v),
                  child: Text(
                    "Number of servings",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                Container(
                  height: 25.v,
                  width: 60.h,
                  decoration: BoxDecoration(
                    color: appTheme.gray80093,
                    borderRadius: BorderRadius.circular(2.h),
                    border: Border.all(
                      color: appTheme.blueGray100,
                      width: 2.h,
                    ),
                  ),
                  child: Center(
                    child: TextField(
                      controller: servingsController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                      onChanged: (value) {
                        setState(() {
                          numberOfServings = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
        ],
      ),
    );
  }

  Widget _buildLineFifteenStack(BuildContext context) {
    return SizedBox(
      height: 1.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(width: double.maxFinite, child: Divider()),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(width: double.maxFinite, child: Divider()),
          ),
        ],
      ),
    );
  }

  Widget _buildMealOptionColumn(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillGray800931,
      child: Column(
        children: [
          _buildLineFifteenStack(context),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 25.h, right: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.v),
                  child: Text(
                    "Meal",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                Container(
                  height: 25.v,
                  width: 100.h,
                  decoration: BoxDecoration(
                    color: appTheme.gray80093,
                    borderRadius: BorderRadius.circular(2.h),
                    border: Border.all(
                      color: appTheme.blueGray100,
                      width: 2.h,
                    ),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedMeal,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMeal = newValue!;
                        });
                      },
                      items: <String>['breakfast', 'lunch', 'diner', 'snack']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
        ],
      ),
    );
  }
}
