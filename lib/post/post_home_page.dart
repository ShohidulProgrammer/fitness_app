import 'package:fitness_app/post/components/add_post.dart';
import 'package:fitness_app/post/components/notification_alart.dart';
import 'package:fitness_app/post/post_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../login_demo/auth.dart';
import '../login_demo/auth_provider.dart';

class PostHomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        backgroundColor: Colors.amber,
        actions: <Widget>[
          InkWell(
            onTap: () => Navigator.of(context).pushNamed('/Chat'),
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.chat_bubble,
              ),
            ),
          ),
          InkWell(
            // onTap: () => Navigator.of(context).pushNamed('/AddPost'),
            onTap: () => addPost(context),
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.add,
              ),
            ),
          ),

          InkWell(
            onTap: () => notificationAlert(context),
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.search),
            ),
          ),
          InkWell(
            onTap: () => notificationAlert(context),
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.notifications_none,
                // color: Colors.grey,
              ),
            ),
          ),

          InkWell(
              onTap: () => _signOut(context),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(
                  MaterialCommunityIcons.logout_variant,
                ),
              )),

          // FlatButton(
          //   child: Text('Logout',
          //       style: TextStyle(fontSize: 17.0, color: Colors.white)),
          //   onPressed: () => _signOut(context),
          // ),
        ],
      ),
      body: PostBody(),
      // Container(
      //   child: Center(child: Text('Welcome', style: TextStyle(fontSize: 32.0))),
      // ),
    );
  }
}
