class WorkoutHistory {
  final String titre;
  final int calories;
  final int duree;
  final String photo;
  final String docId;
  final String catId;

  WorkoutHistory(
      {required this.titre,
      required this.calories,
      required this.photo,
      required this.duree,
      required this.catId,
      required this.docId});

  factory WorkoutHistory.fromMap(Map<String, dynamic> map) {
    return WorkoutHistory(
      titre: map['titre'] ?? '',
      calories: map['calories'] ?? 0,
      duree: map['duree'] ?? 0,
      photo: map['photo'] ?? '',
      docId: map['docId'] ?? '',
      catId: map['catId'] ?? '',
    );
  }
}
