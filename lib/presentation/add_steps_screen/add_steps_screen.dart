import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/presentation/steps_screen/steps_screen.dart';

class AddStepsScreen extends StatefulWidget {
  @override
  _AddStepsScreenState createState() => _AddStepsScreenState();
}

class _AddStepsScreenState extends State<AddStepsScreen> {
  final TextEditingController stepsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  late String formattedDate;

  void _submitData(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      String userEmail = user.email ?? '';

      await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        if (querySnapshot.docs.isNotEmpty) {
          String userId = querySnapshot.docs.first.id;

          print(formattedDate);
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('steps')
              .add({
            'date': formattedDate,
            'nombre': int.tryParse(stepsController.text) ?? 0,
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StepsScreen()),
          );
        } else {
          print('User document not found');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray900,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 33.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 27.h,
                  vertical: 11.v,
                ),
                decoration: AppDecoration.fillGray80093.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCancelRow(context),
                    SizedBox(height: 31.v),
                    _buildDateTimeColumn(context),
                    SizedBox(height: 31.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCancelRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: CustomTextStyles.titleLargeIndigoA40001,
              ),
            ),
          ),
          Spacer(
            flex: 44,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              "Steps",
              style: CustomTextStyles.titleLargePrimary_1,
            ),
          ),
          Spacer(
            flex: 55,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: TextButton(
              onPressed: () {
                _submitData(context);
              },
              child: Text(
                "Add",
                style: CustomTextStyles.titleLargeIndigoA40001,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDateTimeColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.h),
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillGray600.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              right: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Text(
                    "Date",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                Container(
                  width: 80.h,
                  height: 23.v,
                  margin: EdgeInsets.only(bottom: 2.v),
                  padding: EdgeInsets.symmetric(horizontal: 17.h),
                  decoration: AppDecoration.fillBluegray100.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: TextFormField(
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (selectedDate != null) {
                        print(selectedDate);
                        formattedDate =
                            DateFormat('yyyy-MM-dd').format(selectedDate);

                        setState(() {
                          dateController.text = formattedDate;
                          print(dateController.text);
                        });
                      }
                    },
                    controller: dateController,
                    style: theme.textTheme.labelLarge,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            color: appTheme.gray600.withOpacity(0.28),
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              right: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Steps",
                  style: theme.textTheme.labelLarge,
                ),
                Container(
                  width: 80.h,
                  height: 23.v,
                  margin: EdgeInsets.only(bottom: 2.v),
                  padding: EdgeInsets.symmetric(horizontal: 17.h),
                  decoration: AppDecoration.fillBluegray100.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: TextField(
                    controller: stepsController,
                    keyboardType: TextInputType.number,
                    style: theme.textTheme.labelLarge,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
