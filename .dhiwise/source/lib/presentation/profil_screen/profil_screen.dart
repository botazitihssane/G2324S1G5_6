import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProfilScreen extends StatelessWidget {
  ProfilScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 33.h, vertical: 53.v),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Fill your profile",
                                      style: theme.textTheme.headlineLarge),
                                  SizedBox(height: 9.v),
                                  Container(
                                      width: 310.h,
                                      margin: EdgeInsets.only(
                                          left: 8.h, right: 6.h),
                                      child: Text(
                                          "Enhance your fitness experience by adding a few more details. Let's make this journey uniquely yours!",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: theme.textTheme.titleSmall)),
                                  SizedBox(height: 48.v),
                                  SizedBox(
                                      height: 115.v,
                                      width: 123.h,
                                      child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    height: 115.v,
                                                    width: 123.h,
                                                    decoration: BoxDecoration(
                                                        color: appTheme
                                                            .blueGray100,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    61.h)))),
                                            Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Container(
                                                    height: 25.adaptSize,
                                                    width: 25.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        right: 13.h,
                                                        bottom: 2.v),
                                                    child: Stack(
                                                        alignment:
                                                            Alignment.topRight,
                                                        children: [
                                                          CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgFile,
                                                              height:
                                                                  25.adaptSize,
                                                              width:
                                                                  25.adaptSize,
                                                              alignment:
                                                                  Alignment
                                                                      .center),
                                                          CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgTelevision,
                                                              height: 18.v,
                                                              width: 15.h,
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 3.v,
                                                                      right:
                                                                          4.h))
                                                        ])))
                                          ])),
                                  SizedBox(height: 60.v),
                                  _buildUserName(context),
                                  SizedBox(height: 27.v),
                                  _buildEmail(context),
                                  SizedBox(height: 27.v),
                                  _buildPhoneNumber(context),
                                  Spacer(),
                                  SizedBox(height: 23.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 13.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            _buildBack(context),
                                            _buildSave(context)
                                          ]))
                                ])))))));
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 13.h),
        child: CustomTextFormField(
            controller: userNameController,
            hintText: "Username",
            hintStyle: CustomTextStyles.bodyMediumInikaBluegray100));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 13.h),
        child: CustomTextFormField(
            controller: emailController,
            hintText: "Email",
            hintStyle: CustomTextStyles.bodyMediumInikaBluegray100,
            textInputType: TextInputType.emailAddress));
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 13.h),
        child: CustomTextFormField(
            controller: phoneNumberController,
            hintText: "Phone number",
            hintStyle: CustomTextStyles.bodyMediumInikaBluegray100,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.phone,
            prefix: Padding(
                padding: EdgeInsets.fromLTRB(16.h, 18.v, 30.h, 16.v),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imageNotFound,
                      height: 15.v,
                      width: 20.h,
                      margin: EdgeInsets.fromLTRB(16.h, 18.v, 12.h, 16.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imageNotFound,
                      height: 10.adaptSize,
                      width: 10.adaptSize)
                ])),
            prefixConstraints: BoxConstraints(maxHeight: 49.v),
            contentPadding:
                EdgeInsets.only(top: 14.v, right: 30.h, bottom: 14.v)));
  }

  /// Section Widget
  Widget _buildBack(BuildContext context) {
    return CustomElevatedButton(
        width: 150.h,
        text: "Back",
        buttonStyle: CustomButtonStyles.fillGray,
        onPressed: () {
          onTapBack(context);
        });
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
        width: 150.h,
        text: "Save",
        margin: EdgeInsets.only(left: 12.h),
        onPressed: () {
          onTapSave(context);
        });
  }

  /// Navigates to the physicalActivityScreen when the action is triggered.
  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.physicalActivityScreen);
  }

  /// Navigates to the savingPageScreen when the action is triggered.
  onTapSave(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.savingPageScreen);
  }
}
