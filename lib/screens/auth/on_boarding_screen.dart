import 'dart:convert';

import 'package:everyday/blocs/RegisterBloc.dart';
import 'package:everyday/screens/widgets/on_boarding_three.dart';
import 'package:everyday/screens/widgets/on_boarding_two.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:everyday/screens/widgets/on_boarding_one.dart';

import 'package:everyday/screens/main/main_screen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class OnBoardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingScreen> {
  double heightScreen;
  RegisterBloc _registerBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _registerBloc = RegisterBloc();
  }
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
              child: PageIndicatorContainer(
                child: PageView(
                  children: <Widget>[
                    OnBoardingScreenOne(),
                    OnBoardingScreenTwo(),
                    OnBoardingScreenThree()
                  ],
                ),
                length: 3,
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
                        color: Color(0xFF3B5999)),
                    margin: EdgeInsets.only(left: 16, right: 16),
                    height: 48,
                    child: FlatButton(
                      onPressed: () {
                        initiateFacebookLogin();
//                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/ic_facebook.png"),
                          SizedBox(width: 30),
                          Text(
                            "Login with Facebook",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Color(0xFFFFFFFF),
                        border: Border.all(color: Color(0xFFE6E6E6), width: 1)),
                    margin: EdgeInsets.only(left: 16, right: 16, top: 15),
                    height: 48,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MainScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/ic_google.png"),
                          SizedBox(width: 30),
                          Text(
                            "Login with Google",
                            style: TextStyle(
                                color: Color(0xFF666666), fontSize: 14),
                          )
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

  void onLoginStatusChanged(String userId, String email, String name, String avatar) {
    createUser(userId, email, name, avatar);
  }

  void createUser(String userId, String email, String name, String avatar) {
    _registerBloc.registerUserByFacebook(userId, email, name, avatar).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainScreen()));
    });
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin.logIn(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
//        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
//        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${facebookLoginResult.accessToken.token}');

        var profile = json.decode(graphResponse.body);
        print(profile.toString());
        onLoginStatusChanged(facebookLoginResult.accessToken.userId,
            profile["email"], profile["name"], profile['picture']['data']['url']);
        break;
    }
  }
}
