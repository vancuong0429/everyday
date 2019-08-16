import 'package:everyday/screens/widgets/on_boarding_three.dart';
import 'package:everyday/screens/widgets/on_boarding_two.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:everyday/screens/widgets/on_boarding_one.dart';

import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OnBoardingState();

}

class _OnBoardingState extends State<OnBoardingScreen>{
  double heightScreen;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: PageIndicatorContainer(child: PageView(
                children: <Widget>[
                  OnBoardingScreenOne(),
                  OnBoardingScreenTwo(),
                  OnBoardingScreenThree()
                ],
              ), length: 3,
                indicatorSpace: 9,
                padding: EdgeInsets.only(bottom: 32),
                indicatorColor: Color(0x80FFFFFF),
                indicatorSelectorColor: Colors.white,
                shape: IndicatorShape.circle(size: 8),
              ),
            ),
            Container(
              height: heightScreen * 0.3,
              padding: EdgeInsets.only(top: 32),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color(0xFF3B5999)
                    ),
                    margin: EdgeInsets.only(left: 16, right: 16),
                    height: 48,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/ic_facebook.png"),
                          SizedBox(width: 30),
                          Text("Login with Facebook", style: TextStyle(color: Colors.white, fontSize: 14),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Color(0xFFFFFFFF),
                      border: Border.all(color: Color(0xFFE6E6E6), width: 1)
                    ),
                    margin: EdgeInsets.only(left: 16, right: 16, top: 15),
                    height: 48,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/ic_google.png"),
                          SizedBox(width: 30),
                          Text("Login with Google", style: TextStyle(color: Color(0xFF666666), fontSize: 14),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}