import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_outlined_button.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      appTheme.gray8009b,
                      appTheme.blueGray800.withOpacity(0.61)
                    ])),
                child: Form(
                    key: _formKey,
                    child: SizedBox(
                        height: 853.v,
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.center, children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgTheInteriorOf,
                              height: 852.v,
                              width: 393.h,
                              alignment: Alignment.center),
                          Align(
                              alignment: Alignment.center,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 37.v),
                                    _buildLoginSection(context),
                                    SizedBox(height: 210.v),
                                    _buildEmailSection(context)
                                  ]))
                        ]))))));
  }

  /// Section Widget
  Widget _buildLoginSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomAppBar(
          height: 50.v,
          title: Padding(
              padding: EdgeInsets.only(left: 27.h),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.only(right: 1.h),
                    child: Row(children: [
                      AppbarSubtitle(text: "LOGIN"),
                      AppbarSubtitle(
                          text: "SIGN UP",
                          margin: EdgeInsets.only(left: 24.h),
                          onTap: () {
                            navigateToSignup(context);
                          })
                    ])),
                SizedBox(height: 7.v),
                Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Row(children: [
                      Container(
                          height: 8.v,
                          width: 67.h,
                          decoration:
                              BoxDecoration(color: theme.colorScheme.primary)),
                      Container(
                          height: 8.v,
                          width: 88.h,
                          margin: EdgeInsets.only(left: 25.h),
                          decoration:
                              BoxDecoration(color: theme.colorScheme.primary))
                    ]))
              ])),
          actions: [
            AppbarTrailingCircleimage(
                imagePath: ImageConstant.imgIndianMan8043472128050x58,
                margin: EdgeInsets.symmetric(horizontal: 32.h))
          ]),
      SizedBox(height: 114.v),
      Padding(
          padding: EdgeInsets.only(left: 27.h),
          child: Text("Welcome Back !", style: theme.textTheme.displaySmall))
    ]);
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 42.h, vertical: 53.v),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: fs.Svg(ImageConstant.imgGroupGray600),
                        fit: BoxFit.cover)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 48.v),
                      Padding(
                          padding: EdgeInsets.only(right: 14.h),
                          child: CustomTextFormField(
                              controller: emailController,
                              hintText: "Email",
                              hintStyle: CustomTextStyles.titleLarge22,
                              textInputType: TextInputType.emailAddress,
                              alignment: Alignment.centerLeft,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 3.h),
                              borderDecoration:
                                  TextFormFieldStyleHelper.underLineBlack,
                              filled: false)),
                      SizedBox(height: 50.v),
                      Padding(
                          padding: EdgeInsets.only(right: 11.h),
                          child: CustomTextFormField(
                              controller: passwordController,
                              hintText: "Password",
                              hintStyle: CustomTextStyles.titleLarge22,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              obscureText: true,
                              borderDecoration:
                                  TextFormFieldStyleHelper.underLineBlack,
                              filled: false)),
                      SizedBox(height: 46.v),
                      Padding(
                          padding: EdgeInsets.only(right: 10.h),
                          child: Text("Forgot Password?",
                              style: CustomTextStyles.titleLarge22)),
                      SizedBox(height: 17.v),
                      CustomOutlinedButton(
                          height: 35.v,
                          width: 120.h,
                          text: "Sign in",
                          margin: EdgeInsets.only(right: 14.h),
                          buttonStyle: CustomButtonStyles.outlineOrange,
                          buttonTextStyle:
                              CustomTextStyles.titleLargeBlack90001)
                    ]))));
  }

  /// Navigates to the signUpScreen when the action is triggered.
  navigateToSignup(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }
}
