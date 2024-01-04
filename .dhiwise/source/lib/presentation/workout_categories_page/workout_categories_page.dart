import '../workout_categories_page/widgets/cardcomponents_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class WorkoutCategoriesPage extends StatefulWidget {
  const WorkoutCategoriesPage({Key? key})
      : super(
          key: key,
        );

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
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32.v),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 33.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCardComponents(context),
                        SizedBox(height: 459.v),
                        Text(
                          "Hello Mohamed",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displayMedium,
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
    );
  }

  /// Section Widget
  Widget _buildCardComponents(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 33.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return CardcomponentsItemWidget();
          },
        ),
      ),
    );
  }
}
