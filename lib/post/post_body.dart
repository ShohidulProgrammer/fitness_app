import 'package:fitness_app/post/components/reaction_button.dart';
import 'package:fitness_app/post/post_db.dart';
import 'package:fitness_app/post/post_drawer.dart';
import 'package:fitness_app/post/post_model.dart';
import 'package:flutter/material.dart';

class PostBody extends StatefulWidget {
  @override
  _PostBodyState createState() => new _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text(
      //     "Post",
      //     style: TextStyle(fontWeight: FontWeight.w400),
      //   ),
      //   backgroundColor: Colors.black,
      //   actions: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.only(right: 24.0),
      //       child: Icon(
      //         Icons.notifications_none,
      //         color: Colors.grey,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(right: 12.0),
      //       child: Icon(Icons.search, color: Colors.grey),
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          PostModel article = PostDB.getArticle(position);

          return Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              article.author,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            Text(
                              article.date + " . " + article.readTime,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(Icons.bookmark_border),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                      child: Text(
                        article.categoryTitle,
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                    ),
                    Container(
                        // height: 80.0,
                        // width: 80.0,
                        child: Image.asset(
                      "assets/post_assets/post_images/" +
                          article.imageAssetName,
                      fit: BoxFit.cover,
                    )),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                      // padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Flexible(
                          //   flex: 1,
                          //   child: Container(
                          //       height: 80.0,
                          //       width: 80.0,
                          //       child: Image.asset(
                          //         "assets/post_assets/post_images/" +
                          //             article.imageAssetName,
                          //         fit: BoxFit.cover,
                          //       )),
                          // ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  article.description,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold, fontSize: 22.0),
                                      fontSize: 16.0),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  maxLines: descTextShowFlag ? null : 2,
                                  textAlign: TextAlign.start,
                                ),
                                article.description.length > 80
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          top: 12.0,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              descTextShowFlag =
                                                  !descTextShowFlag;
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              descTextShowFlag
                                                  ? Text(
                                                      "Show Less",
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    )
                                                  : Text("Show More",
                                                      style: TextStyle(
                                                          color: Colors.blue))
                                            ],
                                          ),
                                        ))
                                    : Padding(
                                        padding: const EdgeInsets.all(0.0),
                                      ),
                              ],
                            ),

                            // flex: 3,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.comment),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0),
                                  child: Text("Comments"),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                          PageReactiveButton(),
                        ]),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //         Text(
                    //           article.author,
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold, fontSize: 18.0),
                    //         ),
                    //         Text(
                    //           article.date + " . " + article.readTime,
                    //           style: TextStyle(
                    //               color: Colors.black45,
                    //               fontWeight: FontWeight.w500),
                    //         )
                    //       ],
                    //     ),
                    //     Icon(Icons.bookmark_border),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: PostDB.articleCount,
      ),
      drawer: PostDrawer(),
    );
  }
}
