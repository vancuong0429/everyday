import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  double screenHeight;
  double screenWidth;
  Widget _list;
  final double ratio = ui.window.devicePixelRatio;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    print("ratio1: ${MediaQuery.of(context).devicePixelRatio}");
    if (_list == null) {
      _list = new ListView.builder(
        itemCount: 10,
        itemBuilder: getBuilder,
        scrollDirection: Axis.horizontal,
      );
    }
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFC86E), Color(0xFFFA508C)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                padding: EdgeInsets.only(top: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getHeaderHome(),
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.only(left: 16, top: 16, right: 8),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text("04", style: TextStyle(color: Colors.white, fontSize: 30)),
                                      SizedBox(width: 10,),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Wednesday", style: TextStyle(color: Colors.white, fontSize: 14)),
                                            Text("Jan 2017", style: TextStyle(color: Colors.white, fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                      Image.asset("assets/ic_arrow_right.png")
                                    ],
                                  ),
                                  Container(
                                    height: 0.5,
                                    width: double.infinity,
                                    color: Colors.white,
                                    margin: EdgeInsets.only(top: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 16, bottom: 32),
                              child: RichText(text: TextSpan(
                                children: <TextSpan> [
                                  TextSpan(text: "Add a little\n", style: TextStyle(color: Colors.white, fontSize: 36)),
                                  TextSpan(text: "confetti\n", style: TextStyle(color: Color(0xFFFFC864), fontSize: 36)),
                                  TextSpan(text: "to each day.\n\n", style: TextStyle(color: Colors.white, fontSize: 36)),
                                  TextSpan(text: "Need more inspiration? Swipe aside!", style: TextStyle(color: Colors.white, fontSize: 12))
                                ]
                              ),),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 16, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Recent Posts",
                        style:
                            TextStyle(color: Color(0xFF666666), fontSize: 14),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 16),
                          child: Text(
                            "JAN 2017",
                            style: TextStyle(
                                color: Color(0xFF999999), fontSize: 14),
                          ))
                    ],
                  ),

                ],
              ),
            ),
            Container(
                height: 90,
                margin: EdgeInsets.only(bottom: 38),
                child: _list
            )
          ],
        ),
      ),
    );
  }

  Widget getHeaderHome() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 40,
          child: FlatButton(
            child: Image.asset("assets/ic_menu.png"),
            padding: EdgeInsets.all(0),
            onPressed: () {},
          ),
        ),
        Expanded(
            flex: 1,
            child: Text(
              "Everyday",
              style:
              TextStyle(color: Colors.white, fontSize: 17),
              textAlign: TextAlign.center,
            )),
        SizedBox(
          width: 40,
          height: 40,
          child: FlatButton(
            child: Image.asset("assets/ic_notification.png"),
            padding: EdgeInsets.all(0),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget getBuilder(BuildContext context, int index) {
    return Container(
      width: screenWidth * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 6, // has the effect of softening the shadow
              spreadRadius: -4, // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 10
                0, // vertical, move down 10
              ),
            )
          ]
      ),
      padding: EdgeInsets.only(top: 4, left: 10, bottom: 10, right: 10),
      margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "03",
                style: TextStyle(
                  color: Color(0xFF82A0FA),
                  fontSize: 28,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  "TUE",
                  style: TextStyle(color: Color(0xFFC8C8C8), fontSize: 10),
                ),
              )
            ],
          ),
          Text(
            "A slow but sure start.",
            style: TextStyle(color: Color(0xFF666666), fontSize: 12),
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
