import 'package:flutter/material.dart';

class OnBoardingScreenThree extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OnBoardingThreeState();

}

class _OnBoardingThreeState extends State<OnBoardingScreenThree>{
  double heightScreen;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    heightScreen = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFFFC86E), Color(0xFFFA508C) ], begin: Alignment.topLeft, end: Alignment.bottomRight)
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, -0.45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset("assets/ic_combined.png"),
                SizedBox(
                  height: 20,
                ),
                Text("EVERYDAY",  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF), letterSpacing: 2.33),)
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 64,
            child: Column(
              children: <Widget>[
                Text("Discover Journeys",  style: TextStyle(fontSize: 28, color: Color(0xFFFFFFFF)),),
                SizedBox(
                  height: 8,
                ),
                Text("Follow people and be part of their life journey.",  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),)
              ],
            ),
          )
        ],
      ),
    );
  }

}