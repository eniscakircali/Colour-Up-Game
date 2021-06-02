import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class mods extends StatefulWidget{
  @override
  _mods createState() => _mods();
}
class _mods extends State<mods>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0.0,
        title: Text(
          "Mods Description",
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
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Text("In the Classic mode, you have thirty seconds to click the correct buttons. If you would click on the wrong button there is no need to worry about it, you can keep playing.", style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 30,),
            Text("Dec-Increase", style: TextStyle(color: Colors.green, fontSize: 20 , fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Text("In the Decrease - Increase mode, you have five seconds to click the correct buttons. But if you would click on the wrong button you will get punished with minus three seconds. However, for each correct answer, you would get plus a second.",style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 30,),
            Text("Bomb", style: TextStyle(color: Colors.green, fontSize: 20 , fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Text("In the Bomb mode, you have three seconds to click the correct buttons. You have no right to click the wrong buttons and for each correct answer, you would get plus a second.",style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)),
            ),
          ],

        ),
      ),
    );

  }

}
