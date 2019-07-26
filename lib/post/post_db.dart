import 'package:fitness_app/post/post_model.dart';

class PostDB {
  static var articleCount = 4;

  static var categoryTitles = [
    "Belly Fat loos",
    "FROM YOUR NETWORK",
    "BASED ON YOUR READING HISTORY",
    "DATA SCIENCE"
  ];
  static var descriptions = [
    "Crunches, You have to lie down flat on the ground (you can lie down on a yoga mat or any other mat). Bend your knees with your feet flat on the ground. Your feet need to be hip-width apart. You then have to lift your hands and take them behind your head, with your head on your palms or your thumbs behind your ears. Don’t interlock your fingers. Now, inhale deeply in this position. Slowly lift your upper torso off the floor, exhaling at the time. Lift your torso as much as you can without changing the position of any other body part, and then go back to the lying position, inhaling when going back down. You can exhale when you lift your torso again. Try to maintain a three-inch distance between your chest and chin so you don’t strain your neck. The focus should be on the belly, not merely the lift Beginners should try to do 10 crunches per set, and do at least two or three sets in a day.",
    "A crash course on Serverless APIs with Express and MongoDB",
    "What happened Gmail?",
    "A year as a Data Scientist right after college: An honest review"
  ];

  static var authorNames = [
    "Shraddha Kamdar",
    "Adnan Rahic",
    "Avi Ashkenazi",
    "Abhishek Parkbhakar"
  ];
  static var date = ["15 Jun", "15 hours ago", "27 Apr", "14 Jun"];
  static var readTimes = [
    "7 min read",
    "14 min read",
    "8 min read",
    "8 min read"
  ];
  static var imageAssetName = [
    "reduce_belly_fat.jpg",
    "reduce_belly_fat.jpg",
    "gmail.jpeg",
    "umbrella.jpeg"
  ];

  static getArticle(int position) {
    return PostModel(
        categoryTitles[position],
        descriptions[position],
        authorNames[position],
        date[position],
        readTimes[position],
        imageAssetName[position]);
  }
}
