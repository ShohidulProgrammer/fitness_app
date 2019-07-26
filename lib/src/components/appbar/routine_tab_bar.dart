import 'package:flutter/material.dart';
import 'package:fitness_app/exercise/model/routine_model.dart';
import 'package:fitness_app/exercise/ui/home/routine_home_page_body.dart';
import 'package:fitness_app/src/helper/map_routine.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RoutineTabBar extends StatelessWidget {
  RoutineTabBar({Key key, this.title: "Gym"}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // set my routine dynamically
    List<RoutineCardModel> myWorkoutRoutine =
        myRoutineModel['${title}Workouts'];
    List<RoutineCardModel> myFoodRoutine = myRoutineModel['${title}Foods'];
    // List<RoutineCardModel> myWaterRoutine = myRoutineModel['${title}Waters'];
    List<RoutineCardModel> myWaterRoutine = myRoutineModel['DietWaters'];
    List<RoutineCardModel> myTutorialRoutine = myRoutineModel['DietTutorials'];
    // List<RoutineCardModel> myPost = myRoutineModel['${title}Posts'];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(title),
          bottom: TabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.only(left: 20, right: 20),
            tabs: <Widget>[
              Tab(icon: Icon(Icons.fitness_center), text: "Workout"),
              Tab(
                  icon: Icon(MaterialCommunityIcons.food_variant),
                  text: "Food"),
              Tab(icon: Icon(Ionicons.ios_water), text: "Water"),
              Tab(
                  icon: Icon(MaterialCommunityIcons.note_plus),
                  text: "Tutorial"),
              // Tab(
              //     icon: Icon(MaterialCommunityIcons.account_heart),
              //     text: "Post"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // show my routine model dynamically
            RoutineHomePageBody(routineCardModel: myWorkoutRoutine),
            RoutineHomePageBody(routineCardModel: myFoodRoutine),
            RoutineHomePageBody(routineCardModel: myWaterRoutine),
            RoutineHomePageBody(routineCardModel: myTutorialRoutine),
            // RoutineHomePageBody(routineCardModel: myPost),
          ],
        ),
      ),
    );
  }
}
