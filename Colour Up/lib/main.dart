import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:colourgame/mods/Classic.dart';
import 'package:colourgame/mods/incdec.dart';
import 'package:colourgame/mods/bomb.dart';
import 'package:colourgame/otherpages/modsdescription.dart';
import 'package:colourgame/otherpages/highscores.dart';

void main() async {
  runApp(MaterialApp(
    home: MainMenu(),
  ));
}



class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    precacheImage(AssetImage("assets/bg2.jpg"), context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0.0,
        title: Text(
          "Colour Up",
          style: TextStyle(
              color: Colors.green[300], fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg2.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(
                child: ConstrainedBox(
                    constraints:
                    BoxConstraints.tightFor(width: 180, height: 60),
                    child:ElevatedButton(onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Classic()),);

                    }, child: Text("Classic",style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold, fontSize: 17),),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey,
                        elevation: 30,

                        // background color
                          primary: Colors.black54.withOpacity(0.7)
                      ),))),
            SizedBox(height: 15,),
            Container(
                child: ConstrainedBox(
                    constraints:
                    BoxConstraints.tightFor(width: 180, height: 60),
                    child:ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => incdec()),);

                    }, child: Text("Dec-Increase",style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold, fontSize: 17),),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.grey,
                          elevation: 30,
                        // background color
                          primary: Colors.black54.withOpacity(0.7)
                      ),))),
            SizedBox(height: 15),
            Container(
                child: ConstrainedBox(
                    constraints:
                    BoxConstraints.tightFor(width: 180, height: 60),
                    child:ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => bomb()),);

                    }, child: Text("Bomb",style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold, fontSize: 17),),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.grey,
                          elevation: 30,
                        // background color
                          primary: Colors.black54.withOpacity(0.7)
                      ),))),
            SizedBox(height: 15),
          Container(
            child: ConstrainedBox(
                constraints:
                BoxConstraints.tightFor(width: 180, height: 60),
            child:ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => highscores()),);

            }, child: Text("High Scores",style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold, fontSize: 17),),
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.grey,
                  elevation: 30,
                // background color
                  primary: Colors.black54.withOpacity(0.7)
              ),))),
            SizedBox(height: 15),
            Container(
                child: ConstrainedBox(
                    constraints:
                    BoxConstraints.tightFor(width: 180, height: 60),
                    child:ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mods()),);

                    }, child: Text("Mods Description",style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold, fontSize: 17,),),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.grey,
                          elevation: 30,
                        // background color
                          primary: Colors.black54.withOpacity(0.7)
                      ),))),
            SizedBox(height: 15),
            Container(
                child: ConstrainedBox(
                    constraints:
                    BoxConstraints.tightFor(width: 180, height: 60),
                    child:ElevatedButton(onPressed: (){
                        SystemNavigator.pop();

                    }, child: Text("Exit",style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold, fontSize: 17),),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.grey,
                          elevation: 20,
                        // background color
                          primary: Colors.black54.withOpacity(0.7)
                      ),))),
              ],
        )
    ),
      )
    );
  }
}


