import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../food_log_page/widgets/columnsection_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

class FoodLogPage extends StatefulWidget {
  FoodLogPage({Key? key})
      : super(
          key: key,
        );

  @override
  __FoodLogState createState() => __FoodLogState();
}

class __FoodLogState extends State<FoodLogPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Future<List<DocumentSnapshot<Object?>>> _userFood;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  Future<List<DocumentSnapshot>> _fetchUserWater() async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('dailyFoodLog')
        .where('user', isEqualTo: _user!.email)
        .where('date', isEqualTo: formattedDate)
        .limit(1)
        .get();
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillBlueGray,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30.v),
            child: Column(
              children: [
                Text(
                  "Food log",
                  style: theme.textTheme.headlineLarge,
                ),
                SizedBox(height: 37.v),
                _buildFoodLogSection(context),
                Divider(),
                SizedBox(height: 29.v),
                _buildColumnSections(context),
                SizedBox(height: 29.v),
                _buildWaterLogSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFoodLogSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.v),
      decoration: AppDecoration.fillGray800931,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 6.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Text(
                "Calories Remaining",
                style: theme.textTheme.labelLarge,
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "1570",
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                    Text(
                      "Goal",
                      style: CustomTextStyles.bodySmall8,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.v),
                  child: Text(
                    "-",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                Column(
                  children: [
                    Opacity(
                      opacity: 0.79,
                      child: Text(
                        "279",
                        style: CustomTextStyles.labelLargeWhiteA700,
                      ),
                    ),
                    Text(
                      "Food",
                      style: CustomTextStyles.bodySmall8,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.v),
                  child: Text(
                    "+",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                SizedBox(
                  height: 26.v,
                  width: 31.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Exercise",
                          style: CustomTextStyles.bodySmall8,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "185",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.v),
                  child: Text(
                    "=",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 6.h),
                        child: Text(
                          "1476",
                          style: CustomTextStyles.labelLargeIndigoA40001,
                        ),
                      ),
                    ),
                    Text(
                      "Remaining",
                      style: CustomTextStyles.bodySmall8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterLogSection(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
        future: _fetchUserWater(),
        builder: (context, snapshot) {
          List<DocumentSnapshot> waterDocs = snapshot.data ?? [];
          int waterAmount = waterDocs[0]['water'] ?? 0;
          return Container(
            padding: EdgeInsets.symmetric(vertical: 4.v),
            decoration: AppDecoration.fillGray800931,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 6.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.h),
                    child: Text(
                      "Water",
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                SizedBox(height: 5.v),
                Divider(),
                SizedBox(height: 4.v),
                Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 14.v,
                      width: 42.h,
                      margin: EdgeInsets.only(left: 15.v),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "$waterAmount ml",
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: appTheme.whiteA700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 14.v,
                      width: 42.h,
                      margin: EdgeInsets.all(15.v),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.waterScreen,
                                  );
                                },
                                child: Text(
                                  "Add water",
                                  style: theme.textTheme.labelMedium,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ])
              ],
            ),
          );
        });
  }

  /// Section Widget
  Widget _buildColumnSections(BuildContext context) {
    // List of subsections
    List<String> subsections = ['Breakfast', 'Lunch', 'Diner', 'Snack'];

    return Column(
      children: subsections.map((subsection) {
        return ColumnsectionItemWidget(subsection: subsection);
      }).toList(),
    );
  }

  /// Common widget
}
