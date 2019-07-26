import 'package:fitness_app/bmi_calculator/input_page/bmi_input_page.dart';
import 'package:fitness_app/chat_bot/dialog_flow_v2.dart';
import 'package:fitness_app/src/components/appbar/routine_tab_bar.dart';
import 'package:fitness_app/src/components/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key key,
  }) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedPage = 0;
  // int _selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: new AppBar(
        //   title: _pageTitle[_selectedPage], //new Text('Home'),
        //   // backgroundColor: Colors.deepOrangeAccent,
        // ),
        drawer: DrawerMenu(),
        bottomNavigationBar: CurvedNavigationBar(
          // initialIndex: 0,

          items: <Widget>[
            Icon(MaterialCommunityIcons.food_apple, size: 30),
            Icon(Icons.fitness_center, size: 30),
            Icon(Ionicons.md_body, size: 30),
            Icon(Icons.chat, size: 30),
            // Icon(Icons.shopping_basket, size: 30),
            // Icon(Entypo.shop, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 700),
          onTap: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
        ),
        body: Container(
          // color: Colors.blueAccent,
          color: Colors.white,
          child: Center(
            child: _pageOptions[_selectedPage],
          ),
        ));
  }

  // pages class
  final _pageOptions = [
    // MultipageAppBar(),
    RoutineTabBar(title: "Diet"),
    RoutineTabBar(title: "Gym"),
    BmiInputPage(),
    DialogflowV2(title: 'Chat with Bot'),
    // MyPostLoginApp(),
    // GroceryHomePage(),
  ];

  // // pages Title
  // final _pageTitle = [
  //   Text("Gym"),
  //   Text("Glosery"),
  //   // MyAccountPage(),
  //   //DietPlanPage(),
  //   Text("BIM"),
  //   Text("More Pages"),
  //   // TutorialPage(),
  //   // SettingsPage(),
  //   // AboutPage(),
  // ];
}
