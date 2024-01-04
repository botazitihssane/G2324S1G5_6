import '../view_food_screen/widgets/userprofile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class ViewFoodScreen extends StatelessWidget {
  ViewFoodScreen({Key? key}) : super(key: key);

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
                      controller: searchController,
                      hintText: "|Search for a food",
                      hintStyle:
                          CustomTextStyles.bodySmallSFProTextBluegray100),
                  SizedBox(height: 10.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 6.h),
                          child: Text("History",
                              style: theme.textTheme.labelLarge))),
                  SizedBox(height: 7.v),
                  _buildUserProfile(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 37.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftWhiteA700,
            margin: EdgeInsets.only(left: 17.h, top: 21.v, bottom: 14.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleTwo(text: "Snacks"));
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 5.v);
        },
        itemCount: 11,
        itemBuilder: (context, index) {
          return UserprofileItemWidget();
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
