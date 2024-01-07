import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

class ColumnsectionItemWidget extends StatefulWidget {
  final String subsection;

  ColumnsectionItemWidget({Key? key, required this.subsection})
      : super(
          key: key,
        );

  @override
  __ColumnsectionItemWidget createState() => __ColumnsectionItemWidget();
}

class __ColumnsectionItemWidget extends State<ColumnsectionItemWidget> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  Future<List<DocumentSnapshot>> _fetchUserFoodBySubsection(
      String subsection) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('dailyFoodLog')
          .where('user', isEqualTo: _user!.email)
          .limit(1)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        String userId = querySnapshot.docs.first.id;
        QuerySnapshot foodSnapshot = await FirebaseFirestore.instance
            .collection('dailyFoodLog')
            .doc(userId)
            .collection(subsection.toLowerCase())
            .get();
        return foodSnapshot.docs;
      }

      return [];
    } catch (error) {
      print("Error fetching user food: $error");
      return [];
    }
  }

  Widget _buildFoodListWidget() {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: _fetchUserFoodBySubsection(widget.subsection),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        List<DocumentSnapshot> foodList = snapshot.data ?? [];

        return Column(
          children: [
            Column(
              children: foodList.map((foodDoc) {
                print(foodDoc);
                return Container(
                  margin: EdgeInsets.all(5.v),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        foodDoc['food'],
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: appTheme.whiteA700,
                        ),
                      ),
                      Text(
                        foodDoc['calories'].toString(),
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: appTheme.whiteA700,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            _buildEmptyFoodRow(widget.subsection),
            SizedBox(height: 8.v),
          ],
        );
      },
    );
  }

  Widget _buildEmptyFoodRow(String subsection) {
    return GestureDetector(
      onTap: () {
        print("Tapped on 'Add food', navigating to SearchFoodScreen");
        Navigator.of(context).pushNamed(AppRoutes.searchFoodScreen);
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 14.v,
          width: 42.h,
          margin: EdgeInsets.all(0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Add food",
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.v),
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillGray800931,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 5.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.subsection,
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
          SizedBox(height: 5.v),
          Divider(),
          SizedBox(height: 10.v),
          _buildFoodListWidget(),
        ],
      ),
    );
  }
}
