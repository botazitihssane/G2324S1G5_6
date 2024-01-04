import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_drop_down.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';

class ModifyProfilScreen extends StatelessWidget {
  ModifyProfilScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  TextEditingController agevalueController = TextEditingController();

  TextEditingController weightvalueController = TextEditingController();

  TextEditingController heightvalueController = TextEditingController();

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
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 35.h,
                  vertical: 37.v,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Your profile",
                      style: theme.textTheme.headlineLarge,
                    ),
                    SizedBox(height: 37.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgIndianMan80434721280,
                      height: 92.v,
                      width: 100.h,
                      radius: BorderRadius.circular(
                        46.h,
                      ),
                    ),
                    SizedBox(height: 45.v),
                    _buildUserProfileSection(context),
                    SizedBox(height: 13.v),
                    _buildEmailSection(context),
                    SizedBox(height: 17.v),
                    _buildAgeValueSection(context),
                    SizedBox(height: 12.v),
                    Padding(
                      padding: EdgeInsets.only(left: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildWeightInputSection(context),
                          _buildHeightInputSection(context),
                        ],
                      ),
                    ),
                    SizedBox(height: 11.v),
                    _buildPhoneNumberSection(context),
                    SizedBox(height: 48.v),
                    _buildCancelSection(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.h,
        right: 2.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Text(
              "Username",
              style: CustomTextStyles.bodyMediumInikaWhiteA700,
            ),
          ),
          SizedBox(height: 4.v),
          CustomTextFormField(
            controller: userNameController,
            hintText: "ouaazizmohamed",
            hintStyle: CustomTextStyles.bodyMediumInikaBluegray900,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.h,
        right: 2.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Text(
              "Email",
              style: CustomTextStyles.bodyMediumInikaWhiteA700,
            ),
          ),
          SizedBox(height: 4.v),
          CustomTextFormField(
            controller: emailController,
            hintText: "ouaazizmohamed@gmail.com",
            hintStyle: CustomTextStyles.bodyMediumInikaBluegray900,
            textInputType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGenderInputSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text(
            "Gender",
            style: CustomTextStyles.bodyMediumInikaWhiteA700,
          ),
        ),
        SizedBox(height: 4.v),
        CustomDropDown(
          width: 150.h,
          hintText: "Male",
          items: dropdownItemList,
          onChanged: (value) {},
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAgeInputSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Age",
            style: CustomTextStyles.bodyMediumInikaWhiteA700,
          ),
          SizedBox(height: 2.v),
          CustomTextFormField(
            width: 150.h,
            controller: agevalueController,
            hintText: "54",
            hintStyle: CustomTextStyles.bodyMediumInikaBluegray900,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 6.h,
              vertical: 14.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAgeValueSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.h,
        right: 2.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildGenderInputSection(context),
          _buildAgeInputSection(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWeightInputSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Weight",
              style: CustomTextStyles.bodyMediumInikaWhiteA700,
            ),
            SizedBox(height: 2.v),
            CustomTextFormField(
              width: 150.h,
              controller: weightvalueController,
              hintText: "78",
              hintStyle: CustomTextStyles.bodyMediumInikaBluegray900,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 6.h,
                vertical: 14.v,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeightInputSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Height",
              style: CustomTextStyles.bodyMediumInikaWhiteA700,
            ),
            SizedBox(height: 2.v),
            CustomTextFormField(
              width: 150.h,
              controller: heightvalueController,
              hintText: "190",
              hintStyle: CustomTextStyles.bodyMediumInikaBluegray900,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 6.h,
                vertical: 14.v,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.h,
        right: 2.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Text(
              "Phone number",
              style: CustomTextStyles.bodyMediumInikaWhiteA700,
            ),
          ),
          SizedBox(height: 4.v),
          CustomTextFormField(
            controller: phoneNumberController,
            hintText: "+212 6 60 18 89 05",
            hintStyle: CustomTextStyles.bodyMediumInikaBluegray900,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCancelSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomElevatedButton(
              text: "Cancel",
              margin: EdgeInsets.only(right: 9.h),
              buttonStyle: CustomButtonStyles.fillGray,
              buttonTextStyle: CustomTextStyles.titleLargePrimary_1,
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              text: "Save",
              margin: EdgeInsets.only(left: 9.h),
            ),
          ),
        ],
      ),
    );
  }
}
