import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wotkout_app/model/food.dart';
import 'package:wotkout_app/presentation/add_food_2_screen/add_food_2_screen.dart';

import '../search_food_screen/widgets/userprofile1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_search_view.dart';

class SearchFoodScreen extends StatefulWidget {
  SearchFoodScreen({Key? key}) : super(key: key);

  @override
  _SearchFoodScreenState createState() => _SearchFoodScreenState();
}

class _SearchFoodScreenState extends State<SearchFoodScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 5.v),
          child: Column(
            children: [
              CustomSearchView(
                controller: searchController,
                hintText: "Enter food name",
                onChanged: (value) {
                  setState(() {
                    isSearching = value.isNotEmpty;
                  });
                },
              ),
              SizedBox(height: 8.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    isSearching ? "Search result" : "All Foods",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
              SizedBox(height: 9.v),
              _buildUserProfile(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 36.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftWhiteA70013x13,
        margin: EdgeInsets.only(left: 23.h, top: 20.v, bottom: 22.v),
        onTap: () => onTapArrowLeft(context),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(text: "Foods"),
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: isSearching
          ? FirebaseFirestore.instance
              .collection('food')
              .where('nom',
                  isGreaterThanOrEqualTo: searchController.text.toLowerCase())
              .where('nom',
                  isLessThan: searchController.text.toLowerCase() + 'z')
              .snapshots()
          : FirebaseFirestore.instance.collection('food').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<DocumentSnapshot> foods = snapshot.data?.docs ?? [];

          return ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 5.v);
            },
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return Userprofile1ItemWidget(
                foodName: foods[index]['nom'],
                calories: foods[index]['calories'],
                servingSize: foods[index]['servingsize'],
                onAddButtonPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.addFood2Screen,
                    arguments: Food(
                      foodName: foods[index]['nom'],
                      calories: foods[index]['calories'],
                      servingSize: foods[index]['servingsize'],
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
