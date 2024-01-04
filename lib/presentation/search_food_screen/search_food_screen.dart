import '../search_food_screen/widgets/userprofile1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class SearchFoodScreen extends StatelessWidget {
  SearchFoodScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 5.v),
                child: Column(children: [
                  CustomSearchView(
                      controller: searchController, hintText: "Nutella"),
                  SizedBox(height: 8.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text("Search result",
                              style: theme.textTheme.labelLarge))),
                  SizedBox(height: 9.v),
                  _buildUserProfile(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 36.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftWhiteA70013x13,
            margin: EdgeInsets.only(left: 23.h, top: 20.v, bottom: 22.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "Snacks"));
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 5.v);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return Userprofile1ItemWidget();
            }));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
