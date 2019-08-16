import 'dart:async';

import 'package:flutter/material.dart';

import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delayTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.0, -0.4),
              child: Image.asset("assets/ic_app.png"),
            ),
            Align(
              alignment: Alignment(0.0, 0.8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("EVERYDAY", style: TextStyle(color: Color(0xFF666666), fontSize: 24),),
                  Text("Memories jotted down.", style: TextStyle(color: Color(0xFF666666), fontSize: 12),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Timer> delayTime() async{
    return Timer(Duration(seconds: 2), _doneDelay);
  }

  _doneDelay() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBoardingScreen()));
  }

}