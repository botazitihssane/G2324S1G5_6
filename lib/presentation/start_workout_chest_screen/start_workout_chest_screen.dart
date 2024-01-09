import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';
import 'package:wotkout_app/model/exercices.dart';
import 'package:wotkout_app/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:wotkout_app/widgets/app_bar/custom_app_bar.dart';
import 'package:wotkout_app/widgets/custom_elevated_button.dart';
import 'package:wotkout_app/widgets/custom_text_form_field.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StartWorkoutChestScreen extends StatefulWidget {
  final String catId;
  final String docId;
  StartWorkoutChestScreen({
    Key? key,
    required this.catId,
    required this.docId,
  }) : super(key: key);
  @override
  _StartWorkoutChestScreenState createState() =>
      _StartWorkoutChestScreenState();
}

class _StartWorkoutChestScreenState extends State<StartWorkoutChestScreen> {
  late YoutubePlayerController _controller;
  Set<String> expandedItems = {};
  Future<DocumentSnapshot<Map<String, dynamic>>> fetchWorkoutData() async {
    String collectionName = 'categories';

    return await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(widget.catId)
        .collection('workouts')
        .doc(widget.docId)
        .get();
  }

  Future<List<DocumentSnapshot>> fetchStepsData() async {
    String collectionName = 'categories';

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(widget.catId)
          .collection('workouts')
          .doc(widget.docId)
          .collection('etapes')
          .get();

      return querySnapshot.docs;
    } catch (error) {
      print("Error fetching user food: $error");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
          future: fetchWorkoutData(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return Text('No data available');
            }

            final exercice workoutData = exercice(
                title: snapshot.data!['titre'],
                description: snapshot.data!['description'],
                duration: snapshot.data!['duree'],
                calories: snapshot.data!['calories'],
                soustitre: snapshot.data!['soustitre'],
                photo: snapshot.data!['photo']);

            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildStackOne(context, workoutData),
                      _buildStackTwo(context, workoutData),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackOne(BuildContext context, exercice workoutData) {
    return SizedBox(
      height: 269.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.network(
            workoutData.photo,
            height: 269.v,
            width: 393.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStackTwo(BuildContext context, exercice workoutData) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              child: SizedBox(
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.h,
                          vertical: 48.v,
                        ),
                        decoration: AppDecoration.fillOnPrimary.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL32,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                height: 200.v,
                                width: 307.h,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 70.v),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 20.h,
                                              margin: EdgeInsets.fromLTRB(
                                                  5.h, 5.v, 6.h, 5.v),
                                              child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgOverflowmenu,
                                                height: 19.adaptSize,
                                                width: 19.adaptSize,
                                              ),
                                            ),
                                            Text(
                                              "${workoutData.duration} min",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 17.h),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              5.h,
                                                              5.v,
                                                              6.h,
                                                              5.v),
                                                      child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgFireWhiteA700,
                                                        height: 19.adaptSize,
                                                        width: 19.adaptSize,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${workoutData.calories} Cal",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            workoutData.title,
                                            style: CustomTextStyles
                                                .titleLargeOpenSans,
                                          ),
                                          SizedBox(height: 8.v),
                                          Text(
                                            workoutData.soustitre,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          SizedBox(height: 70.v),
                                          SizedBox(
                                            width: 307.h,
                                            child: Text(
                                              workoutData.description,
                                              style: theme.textTheme.bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.v),
                            FutureBuilder(
                              future: fetchStepsData(),
                              builder: (context,
                                  AsyncSnapshot<List<DocumentSnapshot>>
                                      snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }

                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }

                                if (!snapshot.hasData ||
                                    snapshot.data == null ||
                                    snapshot.data!.isEmpty) {
                                  return Text('No data available');
                                }

                                return _buildRowOne(context, snapshot.data!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomElevatedButton(
                              height: 50.v,
                              width: 350.h,
                              text: "Start Workout",
                              margin: EdgeInsets.only(right: 15.h),
                              buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                              buttonTextStyle: CustomTextStyles
                                  .titleMediumOpenSansBlack90001,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowOne(BuildContext context, List<DocumentSnapshot> etapesData) {
    return Column(
      children: etapesData.map((etapeSnapshot) {
        String titre = etapeSnapshot['titre'];
        String photo = etapeSnapshot['photo'];
        String videoUrl = etapeSnapshot['video'];
        print('Title: $titre, Photo: $photo, Video URL: $videoUrl');

        Map<String, dynamic>? data =
            etapeSnapshot.data() as Map<String, dynamic>?;

        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.v),
              decoration: AppDecoration.fillPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        photo,
                        height: 76.v,
                        width: 82.h,
                        fit: BoxFit.cover,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Check if the video URL is present
                          if (videoUrl != null && videoUrl.isNotEmpty) {
                            _showVideoPlayer(videoUrl, context);
                          } else {
                            _toggleSectionVisibility(videoUrl);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.h,
                            top: 9.v,
                            bottom: 9.v,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 122.h,
                                child: Text(
                                  titre,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.titleSmallOpenSans
                                      .copyWith(
                                    height: 1.20,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.v),
                              if (data != null &&
                                  data.containsKey('sets') &&
                                  data.containsKey('reps')) ...{
                                Text(
                                  '${data['sets']} sets | ${data['reps']} reps',
                                  style: theme.textTheme.bodyMedium,
                                ),
                              } else if (data != null &&
                                  data.containsKey('duree')) ...{
                                Text(
                                  '${data['duree']} min',
                                  style: theme.textTheme.bodyMedium,
                                ),
                              },
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowDown,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.only(
                          top: 26.v,
                          right: 16.h,
                          bottom: 26.v,
                        ),
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: expandedItems.contains(videoUrl) ? 100.v : 0,
                    child: expandedItems.contains(videoUrl)
                        ? GestureDetector(
                            onTap: () {
                              if (videoUrl != null && videoUrl.isNotEmpty) {
                                _showVideoPlayer(videoUrl, context);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 9.v,
                                bottom: 9.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (_controller != null) ...{
                                    _buildYoutubePlayer(_controller),
                                  } else ...{
                                    Text(
                                      'Error loading video',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  },
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  )
                ],
              ),
            ),
            // Add some spacing after the expanded section
            SizedBox(height: expandedItems.contains(videoUrl) ? 16.v : 0),
          ],
        );
      }).toList(),
    );
  }

  void _showVideoPlayer(String videoUrl, BuildContext context) {
    try {
      final videoId = YoutubePlayer.convertUrlToId(videoUrl);
      print('video id $videoId');
      _controller = YoutubePlayerController(
          initialVideoId: videoId!,
          flags: const YoutubePlayerFlags(autoPlay: true));

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return YoutubePlayerBuilder(
            player: _buildYoutubePlayer(_controller),
            builder: (context, player) {
              return Scaffold(
                body: player,
              );
            },
          );
        },
      );
    } catch (error) {
      print("Error showing YouTube player: $error");
      // Handle the error (e.g., show an error message)
    }
  }

  YoutubePlayer _buildYoutubePlayer(YoutubePlayerController controller) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
    );
  }

  void _toggleSectionVisibility(String identifier) {
    setState(() {
      if (expandedItems.contains(identifier)) {
        expandedItems.remove(identifier);
      } else {
        expandedItems.add(identifier);
      }
    });
  }
}
