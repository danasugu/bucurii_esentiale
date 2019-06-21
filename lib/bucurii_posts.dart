import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
//import 'package:flutter_html_view/flutter_html_view.dart';


class BucuriiPosts extends StatelessWidget {

  var post;
  BucuriiPosts({Key key, @required var this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: Colors.pinkAccent,
        title: new Text(post['title']['rendered'],
          style: TextStyle(color: Colors.white, fontSize: 19.0, fontFamily: 'IndieFlower'),),
      ),
      body: new Padding(
          padding: EdgeInsets.all(0.0),
          child: new ListView(
              children: <Widget>[
                new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: post["featured_media"] == 0
                      ? 'images/placeholder.png'
                      : post["_embedded"]["wp:featuredmedia"][0]["source_url"],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(21.0, 15.0, 15.0, 10.0),
                  child: Container(
                      child:  Text(post['content']['rendered'].replaceAll(new RegExp(r'<[^>]*?>'), ''))),
                )
              ])),
    );
//    ; )
//    );
  }
}