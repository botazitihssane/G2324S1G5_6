class ExerciceCategorie {
  final String titre;
  final String soustitre;
  final String photo;

  ExerciceCategorie(
      {required this.titre, required this.soustitre, required this.photo});

  factory ExerciceCategorie.fromMap(Map<String, dynamic> map) {
    return ExerciceCategorie(
        titre: map['titre'] ?? '',
        soustitre: map['soustitre'] ?? '',
        photo: map['photo'] ?? '');
  }
}
