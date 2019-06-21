import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

class SplashScreenOne extends StatefulWidget {
  @override
  _SplashScreenOneState createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {

  final FirebaseMessaging _messaging = FirebaseMessaging();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),()=> Navigator.pushNamed(context, "/bucurii"));
    _messaging.getToken().then((tocken){
      print(tocken);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xff622f74),
              gradient: LinearGradient(
                  colors: [Color(0xffffffff), Color(0xfffff2f8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo-cu-Virginia-Sulica.jpg',
    fit: BoxFit.cover,
                height: 170.0,),
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                child: Container(
                  height: 0.5,
                  color: Colors.pinkAccent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Povestea bucuriilor esentiale',
                  style: TextStyle(fontFamily: 'IndieFlower', fontSize: 19.0),),
              ),


//            CircleAvatar(
//              backgroundColor: Colors.transparent,
//              radius: 95.0,
//              backgroundImage: AssetImage('assets/logo-cu-Virginia-Sulica.jpg',
//               ),
//            ),
            ],
          ),
        ],
      ),

    );
  }
}
