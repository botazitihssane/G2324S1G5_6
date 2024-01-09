import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/exercice_categorie.dart';
import 'package:wotkout_app/model/exercices.dart';

class CardlistItemWidget extends StatelessWidget {
  final List<ExerciceCategorie> exercises;

  const CardlistItemWidget({Key? key, required this.exercises})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(exercises.length);
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 327.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: AppDecoration
                    .gradientOnErrorContainerToOnErrorContainer
                    .copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (var exercise in exercises) _buildExerciseRow(exercise),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseRow(ExerciceCategorie exercise) {
    return Container(
      width: 327.h,
      height: 180.v,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(exercise.photo),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16.h),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 13.v,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 89.v),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16.v,
                  width: 2.h,
                  margin: EdgeInsets.only(
                    top: 1.v,
                    bottom: 5.v,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.titre,
                        style: theme.textTheme.bodyLarge,
                      ),
                      Text(
                        exercise.soustitre,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
