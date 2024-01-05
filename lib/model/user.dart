import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomUser {
  String genre = "";
  int age = 0;
  double taille = 0.0;
  double poids = 0.0;
  String activite_physique = "";
  String objectif = "";
  String email = "";
  String telephone = "";
  String username = "";

  Future<void> retrieveUserInfo(String email) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      QuerySnapshot querySnapshot =
          await users.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();
        if (userData is Map<String, dynamic>) {
          genre = userData['genre'] ?? "";
          age = userData['age'] ?? 0;
          taille = userData['taille'] ?? 0.0;
          poids = userData['poids'] ?? 0.0;
          activite_physique = userData['activite_physique'] ?? "";
          objectif = userData['objectif'] ?? "";
          telephone = userData['telephone'] ?? "";
          username = userData['username'] ?? "";
        } else {
          print('User data is not a Map for email: $email');
        }
      } else {
        print('User document does not exist in Firestore for email: $email');
      }
    } catch (e) {
      print('Error retrieving user information from Firestore: $e');
    }
  }

  bool areAttributesEmpty() {
    return genre.isEmpty ||
        age == 0 ||
        taille == 0.0 ||
        poids == 0.0 ||
        activite_physique.isEmpty ||
        objectif.isEmpty;
  }

  Map<String, dynamic> toMap() {
    return {
      'genre': genre,
      'age': age,
      'taille': taille,
      'poids': poids,
      'activite_physique': activite_physique,
      'objectif': objectif,
      'email': email,
      'telephone': telephone,
      'username': username,
    };
  }
}
