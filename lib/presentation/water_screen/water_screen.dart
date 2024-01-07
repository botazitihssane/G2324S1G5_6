import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:intl/intl.dart';

class _MlchipviewItemWidget extends StatelessWidget {
  final String label;

  const _MlchipviewItemWidget({Key? key, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 12.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        label,
        style: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 15.fSize,
          fontFamily: 'Inika',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.gray80093,
      selectedColor: appTheme.gray80093,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.blueGray100,
          width: 2.h,
        ),
        borderRadius: BorderRadius.circular(
          2.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}

class WaterScreen extends StatefulWidget {
  const WaterScreen({Key? key}) : super(key: key);

  @override
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  late TextEditingController _waterController;
  int _selectedAmount = 0;
  late String currentUserEmail;
  @override
  void initState() {
    super.initState();
    _waterController = TextEditingController();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      currentUserEmail = user.email!;
    }
  }

  void _addToDailyFoodLog() async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    CollectionReference dailyFoodLog =
        FirebaseFirestore.instance.collection('dailyFoodLog');

    QuerySnapshot existingLogs = await dailyFoodLog
        .where('user', isEqualTo: currentUserEmail)
        .where('date', isEqualTo: formattedDate)
        .get();

    if (existingLogs.docs.isNotEmpty) {
      DocumentSnapshot log = existingLogs.docs.first;
      int currentWater = log['water'] ?? 0;
      int newWater = currentWater + _selectedAmount;

      await dailyFoodLog.doc(log.id).update({'water': newWater});
    } else {
      await dailyFoodLog.add({
        'user': currentUserEmail,
        'date': formattedDate,
        'water': _selectedAmount,
      });
    }
  }

  Widget _buildCancelRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/food_log_container_screen');
            },
            child: Text(
              "Cancel",
              style: CustomTextStyles.titleLarge20,
            ),
          ),
          Spacer(
            flex: 44,
          ),
          Text(
            "Water",
            style: CustomTextStyles.titleLargePrimary_1,
          ),
          Spacer(
            flex: 55,
          ),
          ElevatedButton(
            onPressed: () {
              _addToDailyFoodLog();
              Navigator.pushReplacementNamed(
                  context, '/food_log_container_screen');
            },
            child: Text(
              "Add",
              style: CustomTextStyles.titleLargeIndigoA40001,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMlChipView(BuildContext context) {
    return Wrap(
      runSpacing: 14.v,
      spacing: 14.h,
      children: [
        _buildMlChipItem("+1500 ml", 1500),
        _buildMlChipItem("+1000 ml", 1000),
        _buildMlChipItem("+500 ml", 500),
      ],
    );
  }

  Widget _buildMlChipItem(String label, int amount) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAmount += amount;
          _waterController.text = _selectedAmount.toString();
        });
      },
      child: _MlchipviewItemWidget(label: label),
    );
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
                    SizedBox(height: 87.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgImgbinWaterBo,
                      height: 69.v,
                      width: 100.h,
                    ),
                    SizedBox(height: 28.v),
                    Container(
                      height: 60.v,
                      width: 100.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.h,
                        vertical: 6.v,
                      ),
                      decoration: AppDecoration.outlineIndigoA.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder2,
                      ),
                      child: TextField(
                        controller: _waterController,
                        onChanged: (value) {
                          // Update _selectedAmount when the text changes
                          _selectedAmount = int.parse(value);
                        },
                        style: TextStyle(
                          color: appTheme.whiteA700,
                          fontSize: 15.fSize,
                          fontFamily: 'Inika',
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '$_selectedAmount ml',
                          hintStyle: TextStyle(
                            color: appTheme.whiteA700.withOpacity(0.6),
                            fontSize: 15.fSize,
                            fontFamily: 'Inika',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    _buildMlChipView(context),
                    SizedBox(height: 20.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
