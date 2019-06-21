import 'package:flutter/material.dart';
import 'starea_bine.dart';
import 'bunatati.dart';
import 'uleiuri.dart';
import 'picatura.dart';
import 'gigia.dart';


class TabPosts extends StatefulWidget {
  @override
  _TabPostsState createState() => _TabPostsState();
}

class _TabPostsState extends State<TabPosts> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2.0,
                      blurRadius: 2.0
                    ),
                  ],
                  color: Colors.white
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.pinkAccent.withOpacity(0.7),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => new Gigia()));
                  },
                ),
              ),
              Positioned(
                top: 35.0,
                left:15.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 140.0,
                      width: 140.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0),
                        image: DecorationImage(
                            image: AssetImage('assets/gigia.jpg'),
                        fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Virginia Sulica',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'IndieFlower',
                          color: Colors.pinkAccent
                        ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
//                            Icon(Icons.favorite, color:Colors.red),
                            Container(
                              width: MediaQuery.of(context).size.width - 210.0,
                              child: Text('Sunt Virginia si iubesc din toata inima uleiurile esentiale si viata traita in armonie cu natura.'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: TabBar(
                  controller: tabController,
                  indicatorColor: Colors.pinkAccent,
                  indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 7.0,
                    labelColor: Colors.pinkAccent,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                  tabs:<Widget>[
                    Tab(
                      child: Text(
                        'Picatura zilei',
                        style: TextStyle(
                          fontSize: 17.0
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Starea de bine',
                        style: TextStyle(
                            fontSize: 17.0
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Uleiuri esentiale',
                        style: TextStyle(
                            fontSize: 17.0
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Bunatati esentiale',
                        style: TextStyle(
                            fontSize: 17.0
                        ),
                      ),
                    )

                  ]
                ),
              )

            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height -275.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                new PicaturaPosts(),
                new StareaBinePosts(),
                new UleiuriPosts(),
                new BunatatiPosts(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
