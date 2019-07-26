import 'package:flutter/material.dart';

import 'package:fitness_app/exercise/model/routine_model.dart';

// my imports
import 'package:fitness_app/exercise/ui/common/routine_summary.dart';
import 'package:fitness_app/exercise/ui/component/sliver_appbar_deligate.dart';

class RoutineHomePageBody extends StatelessWidget {
  final List<RoutineCardModel> routineCardModel;
  final int month;
  RoutineHomePageBody(
      {Key key, this.month = 1, @required this.routineCardModel});

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 40.0,
        maxHeight: 100.0,
        child: Container(
            color: Colors.pink[200],
            child: Center(
                child: Text(
              headerText,
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Expanded(
          child: new Container(
            // color: new Color(0xFF736AB7),
            child: new CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              slivers: <Widget>[
                // makeHeader('Month $month'),
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  sliver: new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                      // (context, index) => new WorkoutSummary(gymWorkouts[index]),
                      // childCount: gymWorkouts.length,
                      (context, index) =>
                          new RoutineCardSummary(routineCardModel[index]),
                      childCount: routineCardModel.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
