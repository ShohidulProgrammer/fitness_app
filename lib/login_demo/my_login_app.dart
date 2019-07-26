import 'package:flutter/material.dart';
import '../login_demo/auth.dart';
import '../login_demo/auth_provider.dart';
import '../login_demo/root_page.dart';

// void main() => runApp(MyApp());

class MyPostLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      // child: MaterialApp(
      //   title: 'Flutter login demo',
      //   theme: ThemeData(
      //     primarySwatch: Colors.blue,
      //   ),
      // home: RootPage(),
      child: RootPage(),
    );
  }
}
