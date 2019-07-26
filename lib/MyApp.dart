import 'package:fitness_app/chat_bot/dialog_flow_v2.dart';
// import 'package:fitness_app/chat_bot/chat_masseges.dart';


import 'package:fitness_app/login_demo/my_login_app.dart';
import 'package:fitness_app/src/components/appbar/routine_tab_bar.dart';
import 'package:fitness_app/src/components/drawer_menu.dart';
import 'package:flutter/material.dart';

// my imports

// bmi calculator
import 'package:fitness_app/bmi_calculator/input_page/bmi_input_page.dart';
import 'package:fitness_app/bmi_calculator/styles.dart';

import 'package:fitness_app/src/components/bottom_navigation_bar.dart';
// company info
import 'package:fitness_app/src/pages/companyinfo/about.dart';
import 'package:fitness_app/src/pages/companyinfo/contact.dart';
import 'package:fitness_app/src/animation/slide_left_transection_route.dart';

// route animation transection
import 'package:fitness_app/src/animation/scale_route.dart';
import 'package:fitness_app/src/animation/slide_right_transection_route.dart';

import 'package:fitness_app/bmi_calculator/calculator.dart' as calculator;

// use this syntex for navigation
// Navigator.push(
//   context,
//   SlideRightRoute(widget: DietPlanPage()),
// );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      //showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      title: 'Exercise Management System',
      theme: new ThemeData(
        primaryColor: mainDarkCyan, //mainBlue,
        fontFamily: 'SF Pro Display',
      ),

      home: new BottomNavBar(),

      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return SlideRightRoute(widget: DrawerMenu());
            break;
          case '/drawer':
            return SlideRightRoute(widget: DrawerMenu());
            break;
          case '/Chat':
            return SlideRightRoute(
                widget: DialogflowV2(title: 'Chat with Bot'));
            break;

          case '/BMI':
            return SlideRightRoute(widget: BmiInputPage());
            break;
          case '/Post':
            return SlideRightRoute(widget: MyPostLoginApp());
            break;
          case '/Gym':
            return SlideLeftRoute(widget: RoutineTabBar(title: "Gym"));
            break;
          case '/Diet':
            return SlideLeftRoute(
                widget: RoutineTabBar(
              title: 'Diet',
            ));
            break;
          case '/DietType':
            return SlideLeftRoute(
                widget: RoutineTabBar(
              title: 'Diet${calculator.exerciseType()}',
            ));
            break;
          case '/GymType':
            return SlideLeftRoute(
                widget: RoutineTabBar(
              title: 'Gym${calculator.exerciseType()}',
            ));
            break;

          // case '/Shop':
          //   return SlideLeftRoute(widget: GroceryHomePage());
          //   break;

          case '/Contact':
            return ScaleRoute(widget: ContactPage());
            break;
          // case '/Settings':
          //   return ScaleRoute(widget: SettingsPage());
          //   break;
          case '/About':
            return ScaleRoute(widget: AboutPage());
            break;
        }
      },
      // routes: <String, WidgetBuilder>{
      //   '/My account' : (BuildContext context) => new MyAccountPage(),
      //   '/BIM' : (BuildContext context) => new BMIPage(),
      //   '/Food' : (BuildContext context) => new FoodPage(),
      //   '/Diet Plan' : (BuildContext context) => new DietPlanPage(),
      //   '/Contact': (BuildContext context) => new ContactPage(),
      //   '/Gym': (BuildContext context) => new GymScreen(),
      //   '/Tutorial': (BuildContext context) => new TutorialScreen(),
      //   '/Home': (BuildContext context) => new HomePage(),
      //   '/About': (BuildContext context) => new AboutPage(),
      //   '/Settings': (BuildContext context) => new SettingsPage(),
      // },
    );
  }
}
