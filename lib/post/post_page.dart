import 'dart:async';
import 'dart:io';

import 'package:fitness_app/login_demo/login_page.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

// final googleSignIn = new GoogleSignIn();
// final analytics = new FirebaseAnalytics();
final auth = FirebaseAuth.instance;
final reference = FirebaseDatabase.instance.reference().child('Blogs');

Future<Null> _ensureLoggedIn() async {
  FirebaseUser user = auth.currentUser() as FirebaseUser;
  if (user == null) {
    LoginPage();
  }

  // analytics.logLogin();

  // GoogleSignInAccount user = googleSignIn.currentUser;
  // if (user == null) user = await googleSignIn.signInSilently();
  // if (user == null) {
  //   user = await googleSignIn.signIn();

  // if (await auth.currentUser() == null) {
  //   GoogleSignInAuthentication credentials =
  //       await googleSignIn.currentUser.authentication;
  //   await auth.signInWithGoogle(
  //     idToken: credentials.idToken,
  //     accessToken: credentials.accessToken,
  //   );
  // }
}

class PostBlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _PostPage();
    // new MaterialApp(
    //   // routes: <String, WidgetBuilder>{
    //   //   "/home": (BuildContext context) => new HomePage(),
    //   // },
    //   home: new Scaffold(
    //       appBar: new AppBar(
    //         title: new Text('Post Blog..'),
    //       ),
    //       body: new _PostPage()),
    // );
  }
}

class _PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => new _PostPageState();
}

class _PostPageState extends State<_PostPage> {
  File _image;

  final TextEditingController _title = new TextEditingController();
  final TextEditingController _desc = new TextEditingController();

  bool _isTitle = false;
  bool _isDesc = false;
  bool _isImage = false;
  bool _isLoading = false;
  String url;

  // Future getImageFromGallery() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: new Container(
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: _isLoading ? new CircularProgressIndicator() : null,
              ),
              new Padding(padding: const EdgeInsets.only(top: 24.0)),
              new InkWell(
                child: _image == null
                    ? new Image.asset(
                        'assets/post_assets/post_images/img-placeholder.jpg',
                        height: 200.0,
                        width: 400.0,
                        fit: BoxFit.fill,
                      )
                    : new Image.file(
                        _image,
                        height: 200.0,
                        width: 400.0,
                      ),
                onTap: () {
                  // getImageFromCamera();
                  _isImage = true;
                },
              ),
              FloatingActionButton(
                onPressed: () => Text('Image picker disabled'),
                //getImage,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextField(
                  controller: _title,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  onChanged: (String text) {
                    setState(() {
                      // _isTitle = text.length > 0;
                      _isTitle = text.trim().length > 0;
                    });
                  },
                  decoration: new InputDecoration.collapsed(
                    hintText: "Title",
                    border: new UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          style: BorderStyle.solid,
                          width: 5.0),
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextField(
                  controller: _desc,
                  style: new TextStyle(color: Colors.black, fontSize: 18.0),
                  onChanged: (String text) {
                    setState(() {
                      _isDesc = text.length > 0;
                    });
                  },
                  decoration: new InputDecoration.collapsed(
                    hintText: "Description",
                    border: new UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          style: BorderStyle.solid,
                          width: 5.0),
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new RaisedButton(
                  padding: const EdgeInsets.only(
                      left: 45.0, right: 45.0, top: 15.0, bottom: 15.0),
                  color: Colors.blueAccent,
                  elevation: 2.0,
                  child: new Text(
                    "Post",
                    style: new TextStyle(color: Colors.white),
                  ),
                  onPressed: _isTitle && _isDesc && _isImage && !_isLoading
                      ? () => _handleSubmitted(_title.text, _desc.text, _image)
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future getImageFromCamera() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.camera);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.camera);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  Future<Null> _handleSubmitted(String title, String desc, File img) async {
    setState(() {
      _isLoading = true;
    });
    await _ensureLoggedIn();

    StorageReference ref = FirebaseStorage.instance.ref().child("postImages/" +
        new DateTime.now().millisecondsSinceEpoch.toString()); //new
    StorageUploadTask uploadTask = ref.putFile(img); //new
    Uri downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    url = downloadUrl.toString();

    // Uri downloadUrl = (await uploadTask.onComplete).uploadSessionUri;

    _addBlog(title, desc, url);
  }

  void _addBlog(String title, String description, String imageUrl) {
//    print(googleSignIn.currentUser.displayName);
//    print(googleSignIn.currentUser.id);
//    print(title);
//    print(imageUrl);
//    print(description);
    reference.push().set({
      'IMAGE': imageUrl,
      'Title': title,
      'DESCRIPTION': description,
      'uid': auth.currentUser,
      // 'username': googleSignIn.currentUser.displayName
    });
//    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (Builder)))
//    Navigator.of(context).pushAndRemoveUntil(
//        new MaterialPageRoute(
//            builder: (BuildContext context) => new HomePage()),
//        (Route route) => route == null);
//    print("success");
    // analytics.logEvent(name: 'posts');
    setState(() {
      _isLoading = false;
      _title.clear();
      _desc.clear();
      _isTitle = false;
      _isDesc = false;
      _isImage = false;
      _image = null;
    });
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text("Posted Successfully!"),
    ));
  }
}
