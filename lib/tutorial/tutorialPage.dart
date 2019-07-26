import 'package:flutter/material.dart';
//import 'package:flutter_app/components/DrawerMenu.dart';
//import 'package:flutter_app/components/bottom_navigation_bar.dart';

class TutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Tutorial Screen'),
      // ),
      //drawer: DrawerMenu(),
      //bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: RaisedButton(
          child: Text('tutorial page '),
          onPressed: () {
            // Navigate to second screen when tapped!
          },
        ),
      ),
    );
  }
}
