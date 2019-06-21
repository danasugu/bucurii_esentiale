import 'package:flutter/material.dart';
import 'bucurii_posts.dart';


import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

class StareaBinePosts extends StatefulWidget {
  @override
  _StareaBinePostsState createState() => _StareaBinePostsState();
}

class _StareaBinePostsState extends State<StareaBinePosts> {
  // Base URL for our wordpress API
  final String apiUrl = "https://bucuriiesentiale.ro/wp-json/wp/v2/";

  // Empty list for our posts
  List posts;

  // Function to fetch list of posts
  Future<String> getPosts() async {
    var res = await http.get(
        Uri.encodeFull(apiUrl + "posts?categories=38&_embed"),
        headers: {"Accept": "application/json"});

    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: posts == null ? 0 : posts.length,
        itemBuilder: (BuildContext context, int index){
          return Column(
//            padding: EdgeInsets.only(left: 15.0),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: new FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: posts[index]["featured_media"] == 0
                          ? 'images/placeholder.png'
                          : posts[index]["_embedded"]["wp:featuredmedia"][0]["source_url"],
                    ),
                  ),
                  new Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new ListTile(
                        title: new Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: new Text(posts[index]["title"]["rendered"])),
                        subtitle: new Text(
                            posts[index]["excerpt"]["rendered"].replaceAll(new RegExp(r'<[^>]*>'), '')
                        ),
                      )
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => new BucuriiPosts(post: posts[index])));
                    },
                    child: Center(
                      child: Container(
                        height: 50.0,
                        width:170.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.pinkAccent),
                        child: Center(
                          child: Text('Citeste',
                            style: TextStyle(fontFamily: 'OpenSans',
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 13.0,),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
