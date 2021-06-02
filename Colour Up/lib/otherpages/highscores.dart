import 'dart:async';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';





class highscores extends StatefulWidget{
  @override
  _highscores createState() => _highscores();
}
class _highscores extends State<highscores>{

  int x;
  int y;
  int z;


  Future <int> _classhighscore() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    x = prefs.getInt("classScore");
  }


  Future <int> _dechighscore() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    y = prefs.getInt("decScore");
  }



  Future <int> _bombhighscore() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    z = prefs.getInt("BombScore");
  }

  @override
  void initState(){
    super.initState();
    _classhighscore().then((value){
      setState(() {
        x = x;
        _dechighscore().then((value){
          setState(() {
            y = y;
            _bombhighscore().then((value){
              setState(() {
                z = z;
              });
            });
          });
        });
      });
    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0.0,
        title: Text(
          "High Scores",
          style: TextStyle(
              color: Colors.green[500], fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Classic", style: TextStyle(color: Colors.green, fontSize: 20 , fontWeight: FontWeight.bold)),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Text("$x", style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 50,),
            Text("Dec-Increase", style: TextStyle(color: Colors.green, fontSize: 20 , fontWeight: FontWeight.bold)),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Text("$y", style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 50,),
            Text("Bomb", style: TextStyle(color: Colors.green, fontSize: 20 , fontWeight: FontWeight.bold)),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Text("$z", style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold)),

            ),
          ],

        ),
      ),
    );

  }
}