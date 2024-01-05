import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/user.dart';

class SavingPageScreen extends StatelessWidget {
  final CustomUser user;

  SavingPageScreen({Key? key, required this.user}) : super(key: key);

  Future<void> saveUserToFirestore(CustomUser user) async {
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var docId = querySnapshot.docs.first.id;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(docId)
            .update(user.toMap());
      } else {
        await FirebaseFirestore.instance.collection('users').add(user.toMap());
      }
    } catch (e) {
      print('Error saving/updating user to Firestore: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 7.v),
              Text(
                "Saving ... ",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 20.v),
              FutureBuilder(
                future: saveUserToFirestore(user),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text(
                          'Error saving your profile: ${snapshot.error}',
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(height: 20.v),
                        _buildRedirectButton(context),
                      ],
                    );
                  } else {
                    // Profile saved successfully
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushNamed(context, AppRoutes.dashboardScreen);
                    });

                    return Text(
                      'Your profile has been saved!',
                      style: TextStyle(color: Colors.green),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRedirectButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.dashboardScreen);
      },
      child: Text('Go to Dashboard'),
    );
  }
}
