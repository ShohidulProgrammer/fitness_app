import 'package:fitness_app/src/components/drawer_menu_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

//import 'package:fitness_app/components/bottom_navigation_bar.dart';

class DrawerMenu extends StatelessWidget {
  // final VoidCallback onClick;

  // const DrawerMenu({Key key, this.onClick}) : super(key: key);
  DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = "shoikat";
    String email = "Shoikat.cse@gmail.com";

    return new Drawer(
      child: new ListView(
        children: <Widget>[
          // Drawer header
          new UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: new BoxDecoration(color: Colors.red),
          ),

          // Drawer body
          // _buildDrawerListItem(context, 'Home', Icons.home),
          // DrawerMenuItem(title: 'Login', icon: MaterialCommunityIcons.login),
          DrawerMenuItem(
              title: 'Post', icon: MaterialCommunityIcons.account_heart),
          DrawerMenuItem(title: 'Gym', icon: Icons.fitness_center),
          DrawerMenuItem(
              title: 'Diet', icon: MaterialCommunityIcons.food_apple),
          DrawerMenuItem(title: 'BMI', icon: Ionicons.md_body),
          // DrawerMenuItem(title: 'Shop', icon: Icons.shopping_basket),
          Divider(),
          // menu
          // DrawerItem(
          //     title: 'Settings', icon: Icons.settings, iconColor: Colors.blue),
          DrawerMenuItem(
              title: 'About', icon: Icons.help, iconColor: Colors.green),
          DrawerMenuItem(
            title: 'Contact',
            icon: Icons.phone,
            iconColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  // buid drawer list item

  // Widget _buildDrawerListItem(
  //     BuildContext context, String title, IconData icon) {
  //   // String icone =icon.toString();
  //   return InkWell(
  //     onTap: () => Navigator.of(context).pushNamed('/$title'),
  //     child: ListTile(
  //       title: Text(title),
  //       leading: Icon(icon),
  //     ),
  //   );
  // }

  // Widget _buildDrawerMenuItem(
  //     BuildContext context, String title, IconData icon, Color iconColor) {
  //   // String icone =icon.toString();
  //   return InkWell(
  //     onTap: () => Navigator.of(context).pushNamed('/$title'),
  //     child: ListTile(
  //       title: Text(title),
  //       leading: Icon(icon, color: iconColor),
  //     ),
  //   );
  // }

}
