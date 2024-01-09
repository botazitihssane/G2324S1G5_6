import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/exercice_categorie.dart';
import 'package:wotkout_app/presentation/start_workout_chest_screen/start_workout_chest_screen.dart';
import 'package:wotkout_app/presentation/workout_categories_page/widgets/cardlist_item_widget.dart';

class WorkoutCategoriesPage extends StatefulWidget {
  final String categoryId;

  const WorkoutCategoriesPage({Key? key, required this.categoryId})
      : super(key: key);

  @override
  WorkoutCategoriesPageState createState() => WorkoutCategoriesPageState();
}

class WorkoutCategoriesPageState extends State<WorkoutCategoriesPage>
    with AutomaticKeepAliveClientMixin<WorkoutCategoriesPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 650,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32.v),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 50.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCardList(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardList(BuildContext context) {
    print(widget.categoryId);
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 33.h),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('categories')
              .doc(widget.categoryId)
              .collection('workouts')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return Text("No data available");
            }

            var exercises = snapshot.data!.docs;

            // Create a list of exercises with both document ID and data
            List<Map<String, dynamic>> exerciseList = exercises
                .map((exercise) => {
                      'docId': exercise.id,
                      ...exercise.data()!,
                    })
                .toList();

            print(exerciseList.length);

            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: exerciseList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.0);
              },
              itemBuilder: (context, index) {
                var exerciseData = exerciseList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartWorkoutChestScreen(
                          catId: widget.categoryId,
                          docId: exerciseData['docId'],
                        ),
                      ),
                    );
                  },
                  child: CardlistItemWidget(
                    exercises: [ExerciceCategorie.fromMap(exerciseData)],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
