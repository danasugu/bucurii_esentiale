import 'package:flutter/material.dart';
import 'tabs.dart';
import 'package:flutter/cupertino.dart';
import 'webview.dart';

class Gigia extends StatefulWidget {
  @override
  _GigiaState createState() => _GigiaState();
}

class _GigiaState extends State<Gigia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.pink.withOpacity(0.7),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new TabPosts()));
                },
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                            image: AssetImage('assets/gigia.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
                  child: Text('Povestea Bucuriilor Esentiale',
                      style: TextStyle(
                          fontFamily: 'IndieFlower',
                          fontSize: 19.0,
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Buna, eu sunt Virginia si iti spun bun venit pe pagina mea, Bucurii Esentiale! 🙂'
                    '\n\nImi petrec fiecare zi a vietii mele cautand sa descopar frumosul din viata ce ma inconjoara, sa descopar bucurii in clipele ce alcatuiesc viata mea, sa binecuvantez fiecare experienta avuta.'
                    '\n\nCand aveam cam 20 de ani a inceput pentru mine cautarea adevarata. Am gasit pe parcursul drumului multe raspunsuri ale intrebarilor mele, dar pe masura ce le gaseam, rasareau noi si noi provocari.'
                    '\n\nSi iata ca drumul nu se sfarseste niciodata. Devine o calatorie continua, neobosita, frumoasa, uneori si dureroasa, insa mereu am avut ceva de invatat pe parcursul ei. In cautarile mele, am aflat raspunsul multor intrebari.'
                    '\n\nAm constatat ca nu pot sa tin acele raspunsuri numai pentru mine. Am inceput sa vorbesc celor din jur despre bucuriile ce ne inconjoara, despre lucrurile uneori mici si marunte care ne aduc un sentiment de relaxare in viata iar noi nici nu le bagam in seama cu adevarat.'
                    '\n\nAm ales sa ofer prin aceasta pagina personala idei de bucurii esentiale pe care le putem imbratisa cu totii.'
              ),
            ),
            FlatButton.icon(
                onPressed: ()
                {
                  Navigator.of(context).push(new CupertinoPageRoute(
                      builder: (BuildContext context) =>
                      new VisitSite()));
                },
                icon: Icon(Icons.launch), label: Text('citeste mai departe in browser',style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14.0),))
          ],
        )
      ]),
    );
  }
}
