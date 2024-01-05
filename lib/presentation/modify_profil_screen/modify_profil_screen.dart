import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/widgets/custom_drop_down.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';

class ModifyProfilScreen extends StatefulWidget {
  @override
  _ModifyProfilScreenState createState() => _ModifyProfilScreenState();
}

class _ModifyProfilScreenState extends State<ModifyProfilScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  String? _userId;
  String? _userName;
  String? _email;
  String? _phoneNumber;
  String? _gender;
  int? _age;
  int? _weight;
  int? _height;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  List<String> dropdownItemList = ["Male", "Female"];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  Future<void> _getUserInfo() async {
    if (_user != null) {
      QuerySnapshot usersQuery = await _firestore
          .collection('users')
          .where('email', isEqualTo: _user!.email)
          .get();
      print("Query email: ${_user!.email}");
      print("Number of documents found: ${usersQuery.docs.length}");

      if (usersQuery.docs.isNotEmpty) {
        DocumentSnapshot userDoc = usersQuery.docs.first;
        final String newUserId = userDoc.id;

        // Only update state if the user ID has changed
        if (newUserId != _userId) {
          setState(() {
            _userId = newUserId;
            _userName = userDoc['username'];
            _email = userDoc['email'];
            _phoneNumber = userDoc['telephone'];
            _gender = userDoc['genre'];
            _age = userDoc['age'];
            _weight = userDoc['poids'];
            _height = userDoc['taille'];

            userNameController.text = _userName ?? '';
            emailController.text = _email ?? '';
            ageController.text = _age?.toString() ?? '';
            weightController.text = _weight?.toString() ?? '';
            heightController.text = _height?.toString() ?? '';
            phoneNumberController.text = _phoneNumber ?? '';
          });
        }
      } else {
        print('User not found');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder<void>(
          future: _user == null ? null : _getUserInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _buildUI();
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget _buildUI() {
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
                    SizedBox(height: 40.v),
                    _buildUserProfileSection(context),
                    SizedBox(height: 13.v),
                    _buildEmailSection(context),
                    SizedBox(height: 17.v),
                    _buildAgeValueSection(context),
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
            hintText: "Username",
            hintStyle: CustomTextStyles.bodyMediumInikaBluegray900,
          ),
        ],
      ),
    );
  }

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
            hintText: "Email",
            hintStyle: CustomTextStyles.bodyMediumInikaBluegray900,
            textInputType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }

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
            controller: ageController,
            hintText: "Age",
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
              controller: weightController,
              hintText: "Weight",
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
              controller: heightController,
              hintText: "Height",
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
            hintText: "Phone number",
            hintStyle: CustomTextStyles.bodyMediumInikaBluegray900,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }

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
              onPressed: () {
                // Call the method to update user information
                _updateUserInfo(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateUserInfo(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await _firestore.collection('users').doc(_userId).update({
        'username': userNameController.text,
        'email': emailController.text,
        'genre': _gender,
        'age': int.parse(ageController.text),
        'poids': int.parse(weightController.text),
        'taille': int.parse(heightController.text),
        'telephone': phoneNumberController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Changes saved successfully'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
        ),
      );
      _getUserInfo();
    }
  }
}
