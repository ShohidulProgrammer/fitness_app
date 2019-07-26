import 'package:fitness_app/exercise/db/diet_list.dart';
import 'package:fitness_app/exercise/db/food_list/deit_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_mild_obese_food_list.dart.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_mild_thinness_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_moderate_obese_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_moderate_overweight_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_moderate_thinness_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_normal_range_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_obese_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_overweight_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_pre_overweight_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_severe_obese_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_severe_overweight_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/diet_food_list/diet_severe_thinness_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_mild_obese_food_list.dart.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_mild_thinness_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_moderate_obese_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_moderate_overweight_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_moderate_thinness_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_normal_range_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_overweight_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_pre_overweight_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_severe_obese_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_severe_overweight_food_list.dart';
import 'package:fitness_app/exercise/db/food_list/gym_food_list/gym_severe_thinness_food_list.dart';
import 'package:fitness_app/exercise/db/gym_list.dart';
import 'package:fitness_app/exercise/db/post_list/diet_post_list.dart';
import 'package:fitness_app/exercise/db/post_list/gym_post_list.dart';
import 'package:fitness_app/exercise/db/tutorial_list/diet_tutorial_list.dart';
import 'package:fitness_app/exercise/db/tutorial_list/gym_tutorial_list.dart';
import 'package:fitness_app/exercise/db/water_list/diet_water_list.dart';
import 'package:fitness_app/exercise/db/water_list/gym_water_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_mild_obese_workout_list.dart.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_mild_thinness_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_moderate_obese_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_moderate_overweight_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_moderate_thinness_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_normal_range_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_obese_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_over_weight_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_pre_overweight_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_severe_obese_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_severe_overweight_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/diet_workout_list/diet_severe_thinness_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_mild_obese_workout_list.dart.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_mild_thinness_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_moderate_obese_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_moderate_overweight_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_moderate_thinness_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_normal_range_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_overweight_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_pre_overweight_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_severe_obese_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_severe_overweight_workout_list.dart';
import 'package:fitness_app/exercise/db/workout_list/gym_workout_list/gym_severe_thinness_workout_list.dart';
import 'package:fitness_app/exercise/model/routine_model.dart';

Map<String, List<RoutineCardModel>> myRoutineModel = {
  'DietWorkouts': dietWorkouts,
  'DietFoods': dietFoods,
  'DietWaters': dietWaters,
  'DietTutorials': dietTutorials,
  'DietPosts': dietPosts,
  'GymWorkouts': gymWorkouts,
  'GymFoods': gymFoods,
  'GymWaters': gymWaters,
  'GymTutorials': gymTutorials,
  'GymPosts': gymPosts,

  'DietSevereThinnessWorkouts': dietSevereThinnessWorkouts,
  'DietModerateThinnessWorkouts': dietModerateThinnessWorkouts,
  'DietMildThinnessWorkouts': dietMildThinnessWorkouts,
  'DietNormalRangeWorkouts': dietNormalRangeWorkouts,
  'DietPreOverWeightWorkouts': dietPreOverWeightWorkouts,
  'DietOverWeightWorkouts': dietOverWeightWorkouts,
  'DietModerateOverWeightWorkouts': dietModerateOverWeightWorkouts,
  'DietSevereOverWeightWorkouts': dietSevereOverWeightWorkouts,
  'DietObeseWorkouts': dietObeseWorkouts,
  'DietMildObeseWorkouts': dietMildObeseWorkouts,
  'DietModerateObeseWorkouts': dietModerateObeseWorkouts,
  'DietSevereObeseWorkouts': dietSevereObeseWorkouts,

  'DietSevereThinnessFoods': dietSevereThinnessFoods,
  'DietModerateThinnessFoods': dietModerateThinnessFoods,
  'DietMildThinnessFoods': dietMildThinnessFoods,
  'DietNormalRangeFoods': dietNormalRangeFoods,
  'DietPreOverWeightFoods': dietPreOverWeightFoods,
  'DietOverWeightFoods': dietOverWeightFoods,
  'DietModerateOverWeightFoods': dietModerateOverWeightFoods,
  'DietSevereOverWeightFoods': dietSevereOverWeightFoods,
  'DietObeseFoods': dietObeseFoods,
  'DietMildObeseFoods': dietMildObeseFoods,
  'DietModerateObeseFoods': dietModerateObeseFoods,
  'DietSevereObeseFoods': dietSevereObeseFoods,

  'GymSevereThinnessWorkouts': gymSevereThinnessWorkouts,
  'GymModerateThinnessWorkouts': gymModerateThinnessWorkouts,
  'GymMildThinnessWorkouts': gymMildThinnessWorkouts,
  'GymNormalRangeWorkouts': gymNormalRangeWorkouts,
  'GymPreOverWeightWorkouts': gymPreOverWeightWorkouts,
  'GymOverWeightWorkouts': gymOverWeightWorkouts,
  'GymModerateOverWeightWorkouts': gymModerateOverWeightWorkouts,
  'GymSevereOverWeightWorkouts': gymSevereOverWeightWorkouts,
  'GymObeseWorkouts': dietObeseWorkouts,
  'GymMildObeseWorkouts': gymMildObeseWorkouts,
  'GymModerateObeseWorkouts': gymModerateObeseWorkouts,
  'GymSevereObeseWorkouts': gymSevereObeseWorkouts,

  'GymSevereThinnessFoods': gymSevereThinnessFoods,
  'GymModerateThinnessFoods': gymModerateThinnessFoods,
  'GymMildThinnessFoods': gymMildThinnessFoods,
  'GymNormalRangeFoods': gymNormalRangeFoods,
  'GymPreOverWeightFoods': gymPreOverWeightFoods,
  'GymOverWeightFoods': gymOverWeightFoods,
  'GymModerateOverWeightFoods': gymModerateOverWeightFoods,
  'GymSevereOverWeightFoods': gymSevereOverWeightFoods,
  'GymObeseFoods': dietObeseFoods,
  'GymMildObeseFoods': gymMildObeseFoods,
  'GymModerateObeseFoods': gymModerateObeseFoods,
  'GymSevereObeseFoods': gymSevereObeseFoods,

  // 'dietOverWeightTutorial' :   dietOverWeightTutorial,
};