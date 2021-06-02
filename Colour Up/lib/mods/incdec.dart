import 'dart:math';
import 'dart:async';
import 'dart:core';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:colourgame/main.dart';



class incdec extends StatefulWidget {
  @override
  _incdec createState() => _incdec();
}

class _incdec extends State<incdec> {
  AudioCache _audioCache;
  @override
  void initState() {
    super.initState();
    // create this only once
    _audioCache = AudioCache(prefix: "audio/", fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }
  final timeout = Duration(seconds: 2);
  Color _color = Colors.green;
  Color _text = Colors.black;
  int counter = 0;
  Timer _timer;
  int _start = 5;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/bg2.jpg"), context);
    void startTimer() {
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
        oneSec,
            (Timer timer) {
          setState(() {
            _start--;
          });
          if (_start <= 0) {
            setState(() {
              timer.cancel();
            });
          }
        },
      );
    }

    @override
    void dispose() {
      _timer.cancel();
      super.dispose();
    }

    if (_start <= 0) {

      _decscore() async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // ignore: unrelated_type_equality_checks
        if((prefs.getInt("decScore")) == null){
          prefs.setInt("decScore", counter);
        }
        else if(counter > (prefs.getInt("decScore"))){
          prefs.setInt("decScore", counter);
        }

      }
      _decscore();

      return CupertinoAlertDialog(
        title: Text("Game Over"),
        content: Text("Your Score = $counter"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => incdec()),);
          }, child: Text("Retry")),
          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainMenu()),);
          }, child: Text("Main Menu"))
        ],
      );
    }
    if(flag==false){
      startTimer();
      flag = true;
    }
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          elevation: 0.0,
          title: Text(
            "Dec-Increase",
            style: TextStyle(
                color: Colors.green[500], fontWeight: FontWeight.bold, fontSize: 22),
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
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: _color.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _color.withOpacity(0.5),
                          spreadRadius: 15,
                          blurRadius: 20,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 110, vertical: 100),
                    child: Column(
                      children: [
                        Text("Time=" + "$_start",
                            style: TextStyle(color: Colors.white)),
                        Text(
                          "Score=" + "$counter",
                          style: TextStyle(fontSize: 18, color: _text),
                        )
                      ],
                    )),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                          child: ConstrainedBox(
                            constraints:
                            BoxConstraints.tightFor(width: 40, height: 250),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_color == Colors.green){
                                    _audioCache.play('bubble1.mp3');
                                    counter++;
                                    _start = _start + 1;
                                  }
                                  else if(_color != Colors.green){
                                    _start = _start - 3;
                                  }
                                  Random random = new Random();
                                  int a = random.nextInt(7);

                                  if (a == 1) {
                                    _color = Colors.green;
                                    _text = Colors.black;
                                  }
                                  if (a == 2) {
                                    _color = Colors.yellow;
                                    _text = Colors.black;
                                  }
                                  if (a == 3) {
                                    _color = Colors.red;
                                    _text = Colors.black;
                                  }
                                  if (a == 4) {
                                    _color = Colors.blue;
                                    _text = Colors.black;
                                  }
                                  if (a == 5) {
                                    _color = Colors.purple;
                                    _text = Colors.black;
                                  }
                                  if (a == 6) {
                                    _color = Colors.black;
                                    _text = Colors.white;
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                // background color
                                primary: Colors.green.withOpacity(0.8),
                                shadowColor: Colors.green,
                                elevation: 20,
                                padding: EdgeInsets.symmetric(vertical: 151),
                              ),
                              child: null,
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints:
                          BoxConstraints.tightFor(width: 40, height: 250),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_color == Colors.yellow) {
                                  _audioCache.play('bubble1.mp3');
                                  counter++;
                                  _start = _start + 1;
                                }
                                else if(_color != Colors.yellow){
                                  _start = _start - 3;
                                }
                                Random random = new Random();
                                int a = random.nextInt(7);
                                if (a == 1) {
                                  _color = Colors.green;
                                  _text = Colors.black;
                                }
                                if (a == 2) {
                                  _color = Colors.yellow;
                                  _text = Colors.black;
                                }
                                if (a == 3) {
                                  _color = Colors.red;
                                  _text = Colors.black;
                                }
                                if (a == 4) {
                                  _color = Colors.blue;
                                  _text = Colors.black;
                                }
                                if (a == 5) {
                                  _color = Colors.purple;
                                  _text = Colors.black;
                                }
                                if (a == 6) {
                                  _color = Colors.black;
                                  _text = Colors.white;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              // background color
                              primary: Colors.yellow.withOpacity(0.8),
                              shadowColor: Colors.yellow,
                              elevation: 20,
                              padding: EdgeInsets.symmetric(
                                vertical: 151,
                              ),
                            ),
                            child: null,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints:
                          BoxConstraints.tightFor(width: 40, height: 250),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_color == Colors.red) {
                                  _audioCache.play('bubble1.mp3');
                                  counter++;
                                  _start = _start + 1;
                                }
                                else if(_color != Colors.red){
                                  _start = _start - 3;
                                }
                                Random random = new Random();
                                int a = random.nextInt(7);
                                if (a == 1) {
                                  _color = Colors.green;
                                  _text = Colors.black;
                                }
                                if (a == 2) {
                                  _color = Colors.yellow;
                                  _text = Colors.black;
                                }
                                if (a == 3) {
                                  _color = Colors.red;
                                  _text = Colors.black;
                                }
                                if (a == 4) {
                                  _color = Colors.blue;
                                  _text = Colors.black;
                                }
                                if (a == 5) {
                                  _color = Colors.purple;
                                  _text = Colors.black;
                                }
                                if (a == 6) {
                                  _color = Colors.black;
                                  _text = Colors.white;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              // background color
                              primary: Colors.red.withOpacity(0.7),
                              shadowColor: Colors.red,
                              elevation: 20,
                              padding: EdgeInsets.symmetric(
                                vertical: 151,
                              ),
                            ),
                            child: null,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints:
                          BoxConstraints.tightFor(width: 40, height: 250),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_color == Colors.blue) {
                                  _audioCache.play('bubble1.mp3');
                                  counter++;
                                  _start = _start + 1;
                                }
                                else if(_color != Colors.blue){
                                  _start = _start - 3;
                                }
                                Random random = new Random();
                                int a = random.nextInt(7);
                                if (a == 1) {
                                  _color = Colors.green;
                                  _text = Colors.black;
                                }
                                if (a == 2) {
                                  _color = Colors.yellow;
                                  _text = Colors.black;
                                }
                                if (a == 3) {
                                  _color = Colors.red;
                                  _text = Colors.black;
                                }
                                if (a == 4) {
                                  _color = Colors.blue;
                                  _text = Colors.black;
                                }
                                if (a == 5) {
                                  _color = Colors.purple;
                                  _text = Colors.black;
                                }
                                if (a == 6) {
                                  _color = Colors.black;
                                  _text = Colors.white;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              // background color
                              primary: Colors.blue.withOpacity(0.8),
                              shadowColor: Colors.blue,
                              elevation: 20,
                              padding: EdgeInsets.symmetric(
                                vertical: 151,
                              ),
                            ),
                            child: null,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints:
                          BoxConstraints.tightFor(width: 40, height: 250),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_color == Colors.purple) {
                                  _audioCache.play('bubble1.mp3');
                                  counter++;
                                  _start = _start + 1;
                                }
                                else if(_color != Colors.purple){
                                  _start = _start - 3;
                                }
                                Random random = new Random();
                                int a = random.nextInt(7);
                                if (a == 1) {
                                  _color = Colors.green;
                                  _text = Colors.black;
                                }
                                if (a == 2) {
                                  _color = Colors.yellow;
                                  _text = Colors.black;
                                }
                                if (a == 3) {
                                  _color = Colors.red;
                                  _text = Colors.black;
                                }
                                if (a == 4) {
                                  _color = Colors.blue;
                                  _text = Colors.black;
                                }
                                if (a == 5) {
                                  _color = Colors.purple;
                                  _text = Colors.black;
                                }
                                if (a == 6) {
                                  _color = Colors.black;
                                  _text = Colors.white;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              // background color
                              primary: Colors.purple.withOpacity(0.8),
                              shadowColor: Colors.purple,
                              elevation: 20,
                              padding: EdgeInsets.symmetric(
                                vertical: 151,
                              ),
                            ),
                            child: null,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints:
                          BoxConstraints.tightFor(width: 40, height: 250),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_color == Colors.black) {
                                  _audioCache.play('bubble1.mp3');
                                  counter++;
                                  _start = _start + 1;
                                }
                                else if(_color != Colors.black){
                                  _start = _start - 3;
                                }
                                Random random = new Random();
                                int a = random.nextInt(7);
                                if (a == 1) {
                                  _color = Colors.green;
                                  _text = Colors.black;
                                }
                                if (a == 2) {
                                  _color = Colors.yellow;
                                  _text = Colors.black;
                                }
                                if (a == 3) {
                                  _color = Colors.red;
                                  _text = Colors.black;
                                }
                                if (a == 4) {
                                  _color = Colors.blue;
                                  _text = Colors.black;
                                }
                                if (a == 5) {
                                  _color = Colors.purple;
                                  _text = Colors.black;
                                }
                                if (a == 6) {
                                  _color = Colors.black;
                                  _text = Colors.white;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              // background color
                              primary: Colors.black.withOpacity(0.8),
                              shadowColor: Colors.black,
                              elevation: 20,
                              padding: EdgeInsets.symmetric(
                                vertical: 151,
                              ),
                            ),
                            child: null,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}