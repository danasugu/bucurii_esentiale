import 'package:flutter/material.dart';
import 'splash_screen.dart';

import 'tabs.dart';

var routes=<String,WidgetBuilder>{
  "/bucurii" : (BuildContext context) => TabPosts(),
};

void main() {
  runApp(new MaterialApp(
    title: 'Bucurii Esentiale',
    theme: ThemeData(
        primaryColor: Color(0xfffda2cb),
        accentColor: Colors.pink
    ),
    debugShowCheckedModeBanner: false,
    home: SplashScreenOne(),
    routes: routes,
  ));
}
