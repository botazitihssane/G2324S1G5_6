import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/presentation/sign_in_screen/auth.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_outlined_button.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? errorMessage = '';

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      await Auth().signinWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (Auth().currentUser != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.dashboardScreen);
      } else {
        print('Authentication failed.');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      print('Error during sign-in: ${e.code} - ${e.message}');
    } catch (e) {
      setState(() {
        errorMessage = 'An unexpected error occurred.';
      });
      print('Unexpected error during sign-in: $e');
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
                appTheme.blueGray800.withOpacity(0.61),
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
                        _buildLogin(context),
                        SizedBox(height: 163.v),
                        _buildScrollView(context),
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

  Widget _buildLogin(BuildContext context) {
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
                    AppbarSubtitle(text: "LOGIN"),
                    AppbarSubtitle(
                      text: "SIGN UP",
                      margin: EdgeInsets.only(left: 50.h),
                      onTap: () {
                        navigateToSingUp(context);
                      },
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
        Container(
          width: 255.h,
          margin: EdgeInsets.only(left: 27.h),
          child: Text(
            "Welcome Back ! ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.displaySmall,
          ),
        ),
      ],
    );
  }

  Widget _buildScrollView(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 42.h,
            vertical: 53.v,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: fs.Svg(
                ImageConstant.imgGroupGray600,
              ),
              fit: BoxFit.cover,
            ),
          ),
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 3.h),
                  textStyle: CustomTextStyles.titleLarge22,
                  borderDecoration: TextFormFieldStyleHelper.underLineBlack,
                  filled: false,
                ),
              ),
              SizedBox(height: 48.v),
              Padding(
                padding: EdgeInsets.only(right: 14.h),
                child: CustomTextFormField(
                  controller: passwordController,
                  hintText: "Password",
                  hintStyle: CustomTextStyles.titleLarge22,
                  textInputAction: TextInputAction.done,
                  alignment: Alignment.centerLeft,
                  contentPadding: EdgeInsets.symmetric(horizontal: 3.h),
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  borderDecoration: TextFormFieldStyleHelper.underLineBlack,
                  filled: false,
                  textStyle: CustomTextStyles.titleLarge22,
                ),
              ),
              SizedBox(height: 48.v),
              Padding(
                padding: EdgeInsets.only(right: 14.h),
                child: Text(
                  errorMessage ?? "",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 17.v),
              CustomOutlinedButton(
                height: 35.v,
                width: 120.h,
                text: "Log In",
                margin: EdgeInsets.only(right: 14.h),
                buttonStyle: CustomButtonStyles.outlineOrange,
                buttonTextStyle: CustomTextStyles.titleLargeBlack90001,
                onPressed: () => signInWithEmailAndPassword(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSingUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }
}
