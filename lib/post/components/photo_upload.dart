// import 'package:fitness_app/post/post_home_page.dart';
// import 'package:fitness_app/post/post_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class UploadPhotoPage extends StatefulWidget {
  UploadPhotoPage({Key key}) : super(key: key);

  _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  File sampleImage;
  String _description = "";
  String _title = "Fat reduce";
  String url;
  bool btn = true;
  final formKey = GlobalKey<FormState>();

  // Future getImage() async {
  //   var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     sampleImage = tempImage;
  //   });
  // }

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void uploadStatusImage() async {
    if (validateAndSave()) {
      setState(() {
        btn = false;
      });
      final StorageReference postImageRef =
          FirebaseStorage.instance.ref().child("postImages");
      var timeKey = DateTime.now();
      final StorageUploadTask uploadTask =
          postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);

      var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

      url = imageUrl.toString();

      print("umage Url: $url");

      gotoPostHomePage();

      saveToDatabase(url);
    }
  }

  void saveToDatabase(url) {
    var dbTimeKey = DateTime.now();

    var formatDate = DateFormat('dd-MM-yyyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    print("Task ready");

    // DocumentReference ref = Firestore.instance.collection('posts').document();
    Map<String, dynamic> data = {
      'uid': '1',
      'title': _title,
      'description': _description,
      'image': url,
      'date': date,
      'tiem': time
    };

    // ref.setData(data).catchError((e) {
    //   print('set Data Error: $e');
    // }).whenComplete(() {
    //   print("Task created");
    // });
    // addData(data);

    // DatabaseReference ref = FirebaseDatabase.instance.reference();
    // var data = {
    //   "image": url,
    //   "description": _description,
    //   "date": date,
    //   "time": time,
    // };

    // ref.child("posts").push().set(data);

    // .setData({
    //
    // });
  }

  // Future<void> addData(data) async {
  //   Firestore.instance.collection('posts').add(
  //       {'title': '$_title', 'description': '$_description'}).catchError((e) {
  //     print('Error: $e\n');
  //   });
  // }

  void gotoPostHomePage() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return PostHomePage();
    // }));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: new Container(
              child: new Column(children: <Widget>[
            Center(
              child: sampleImage == null
                  ? Text("Select an Image")
                  : enableUpload(),
            ),
            FloatingActionButton(
              tooltip: "Add Image",
              child: Icon(Icons.add_a_photo),
              onPressed: () => Text("Image picker disabled"), //getImage,
            ),
          ]))),
    );
  }

  Widget enableUpload() {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Image.file(
              sampleImage,
              height: 330.0,
              width: 660.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                return value.isEmpty ? 'Blog Description is required' : null;
              },
              onSaved: (String value) => _description = value,
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              elevation: 10.0,
              child: Text("Add a New Post"),
              textColor: Colors.white,
              color: Colors.pink,
              onPressed: btn ? uploadStatusImage : null,
            )
          ],
        ),
      ),
    );
  }
}
