import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> retrieveUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('user_email') ?? "";
  }

  bool areAttributesEmpty() {
    return genre.isEmpty ||
        age == 0 ||
        taille == 0.0 ||
        poids == 0.0 ||
        activite_physique.isEmpty ||
        objectif.isEmpty ||
        email.isEmpty ||
        telephone.isEmpty ||
        username.isEmpty;
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
