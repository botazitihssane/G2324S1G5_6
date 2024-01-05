import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/user.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_outlined_button.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController emailEditTextController = TextEditingController();
  TextEditingController passwordEditTextController = TextEditingController();
  TextEditingController confirmPasswordEditTextController =
      TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signUp(BuildContext context) async {
    if (passwordEditTextController.text !=
        confirmPasswordEditTextController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match"),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEditTextController.text,
        password: passwordEditTextController.text,
      );

      CustomUser user = CustomUser();
      user.email = emailEditTextController.text;
      await FirebaseFirestore.instance
          .collection('users')
          .doc()
          .set(user.toMap());

      Navigator.pushReplacementNamed(context, AppRoutes.signInScreen);
    } catch (e) {
      print('Error during registration: $e');
    }
  }

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
              ],
            ),
          ),
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: 853.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgTheInteriorOf,
                    height: 852.v,
                    width: 393.h,
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 37.v),
                        _buildLoginColumn(context),
                        SizedBox(height: 170.v),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 42.h,
                                vertical: 54.v,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: fs.Svg(ImageConstant.imgGroupGray600),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(height: 52.v),
                                  _buildEmailEditText(context),
                                  SizedBox(height: 29.v),
                                  _buildPasswordEditText(context),
                                  SizedBox(height: 28.v),
                                  _buildConfirmPasswordEditText(context),
                                  SizedBox(height: 61.v),
                                  _buildSignUpButton(context),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          height: 50.v,
          title: Padding(
            padding: EdgeInsets.only(left: 27.h),
            child: Column(
              children: [
                Row(
                  children: [
                    AppbarSubtitle(
                      text: "LOGIN",
                      onTap: () {
                        navigateToSignin(context);
                      },
                    ),
                    AppbarSubtitle(
                      text: "SIGN UP",
                      margin: EdgeInsets.only(left: 50.h),
                    ),
                  ],
                ),
                SizedBox(height: 7.v),
                Row(
                  children: [
                    Container(
                      height: 8.v,
                      width: 67.h,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Container(
                      height: 8.v,
                      width: 88.h,
                      margin: EdgeInsets.only(left: 25.h),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 114.v),
        Padding(
          padding: EdgeInsets.only(left: 27.h),
          child: Text(
            "Welcome !",
            style: theme.textTheme.displaySmall,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 14.h),
      child: CustomTextFormField(
        controller: emailEditTextController,
        hintText: "Email",
        hintStyle: CustomTextStyles.titleLarge22,
        textInputType: TextInputType.emailAddress,
        alignment: Alignment.centerLeft,
        contentPadding: EdgeInsets.symmetric(horizontal: 3.h),
        textStyle: CustomTextStyles.titleLarge22,
        borderDecoration: TextFormFieldStyleHelper.underLineBlack,
        filled: false,
      ),
    );
  }

  Widget _buildPasswordEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 14.h),
      child: CustomTextFormField(
        controller: passwordEditTextController,
        hintText: "Password",
        hintStyle: CustomTextStyles.titleLarge22,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        alignment: Alignment.centerLeft,
        contentPadding: EdgeInsets.symmetric(horizontal: 3.h),
        borderDecoration: TextFormFieldStyleHelper.underLineBlack,
        filled: false,
        textStyle: CustomTextStyles.titleLarge22,
      ),
    );
  }

  Widget _buildConfirmPasswordEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 14.h),
      child: CustomTextFormField(
        controller: confirmPasswordEditTextController,
        hintText: "Confirm Password",
        hintStyle: CustomTextStyles.titleLarge22,
        textStyle: CustomTextStyles.titleLarge22,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        alignment: Alignment.centerLeft,
        contentPadding: EdgeInsets.symmetric(horizontal: 3.h),
        borderDecoration: TextFormFieldStyleHelper.underLineBlack,
        filled: false,
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return CustomOutlinedButton(
      height: 35.v,
      width: 120.h,
      text: "Sign up",
      margin: EdgeInsets.only(right: 14.h),
      buttonStyle: CustomButtonStyles.outlineOrange,
      buttonTextStyle: CustomTextStyles.titleLargeBlack90001,
      alignment: Alignment.centerRight,
      onPressed: () => _signUp(context),
    );
  }

  void navigateToSignin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }
}
