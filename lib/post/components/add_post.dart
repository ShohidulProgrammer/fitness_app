import 'package:fitness_app/post/components/photo_upload.dart';
// import 'package:fitness_app/post/post_page.dart';

import 'package:flutter/material.dart';

Future<void> addPost(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user not needed to must tap on button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        title: Text('Whats your mind'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Add A Post'),
              UploadPhotoPage(),
              // PostBlogPage(),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
