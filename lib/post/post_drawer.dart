import 'package:fitness_app/src/components/drawer_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PostDrawer extends StatelessWidget {
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
          DrawerMenuItem(title: 'Profile', icon: Icons.home),
          DrawerMenuItem(
              title: 'Setting', icon: MaterialCommunityIcons.settings),
          DrawerMenuItem(title: 'Gym', icon: Icons.fitness_center),
          DrawerMenuItem(
              title: 'Diet', icon: MaterialCommunityIcons.food_apple),
          DrawerMenuItem(title: 'BMI', icon: Ionicons.md_body),
          DrawerMenuItem(title: 'Shop', icon: Icons.shopping_basket),
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

  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Drawer(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           ListView(
  //             children: <Widget>[
  //               Container(
  //                 child: Padding(
  //                   padding: const EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 16.0),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[
  //                       Icon(
  //                         Icons.account_circle,
  //                         size: 90.0,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Text(
  //                           "John Doe",
  //                           style: TextStyle(fontSize: 20.0),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Text(
  //                           "See profile",
  //                           style: TextStyle(color: Colors.black45),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Container(
  //                   color: Colors.black12,
  //                   child: Padding(
  //                     padding:
  //                         const EdgeInsets.fromLTRB(40.0, 16.0, 40.0, 40.0),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: <Widget>[
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Text(
  //                             "Home",
  //                             style: TextStyle(fontSize: 18.0),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Text(
  //                             "Audio",
  //                             style: TextStyle(fontSize: 18.0),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Text(
  //                             "Bookmarks",
  //                             style: TextStyle(fontSize: 18.0),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Text(
  //                             "Interests",
  //                             style: TextStyle(fontSize: 18.0),
  //                           ),
  //                         ),
  //                         Divider(),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Text(
  //                             "Become a member",
  //                             style:
  //                                 TextStyle(fontSize: 18.0, color: Colors.teal),
  //                           ),
  //                         ),
  //                         Divider(),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Text(
  //                             "New Story",
  //                             style: TextStyle(fontSize: 18.0),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Text(
  //                             "Stats",
  //                             style: TextStyle(fontSize: 18.0),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Text(
  //                             "Drafts",
  //                             style: TextStyle(fontSize: 18.0),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
