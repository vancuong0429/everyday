import 'package:everyday/screens/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewPostState();
}

class _NewPostState extends State<NewPostScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: Container(
        color: Color(0xFFF1F1F1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            getTicker(),
            CustomAppBar(
              height: 48,
              iconSize: 24,
              items: [
                AppBarItem("assets/ic_home_disible.png", "assets/ic_home_disible.png"),
                AppBarItem(
                    "assets/ic_calendar_disible.png", "assets/ic_calendar_disible.png"),
                AppBarItem(
                    "assets/ic_close_new_post.png", "assets/ic_close_new_post.png"),
                AppBarItem(
                    "assets/ic_discover_disible.png", "assets/ic_discover_disible.png"),
                AppBarItem("assets/ic_profile_disible.png", "assets/ic_profile_disible.png")
              ],
              navigationTapped: (index) {
                if (index == 2) {
                  print(index);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFF2F2F2),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              bottom: 10,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFC86E), Color(0xFFFA508C)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                padding: EdgeInsets.only(top: 24),
              ),
            ),
            Positioned(
              left: 0,
              top: 0.1,
              bottom: 1,
              right: 0,
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0x1A000000), width: 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    "SAVE",
                                    style: TextStyle(
                                        color: Color(0xFF999999), fontSize: 14),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              "New Post",
                              style: TextStyle(
                                  color: Color(0xFF030303), fontSize: 17),
                            ),
                            InkWell(
                              child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    "DONE",
                                    style: TextStyle(
                                        color: Color(0xFF82A0FA), fontSize: 14),
                                  )),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              "Entry for January 4, 2017 | 10:30 PM",
                              style: TextStyle(
                                  color: Color(0xFFD1D1D1), fontSize: 11),
                            ),
                            SizedBox(
                              height: 39,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 17),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Add a title",
                                    hintStyle:
                                        TextStyle(color: Color(0xFFC8C8C8))),
                                style: TextStyle(
                                    fontSize: 24, color: Color(0xFF666666)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 17, top: 15),
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Start writing…",
                                      hintStyle:
                                          TextStyle(color: Color(0xFFC8C8C8))),
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF999999)),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTicker() {
    bool _enabledPublic = false;
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            child: Image.asset("assets/ic_calendar.png"),
            onTap: () {},
          ),
          InkWell(
            child: Image.asset("assets/ic_my_map.png"),
            onTap: () {},
          ),
          InkWell(
            child: Image.asset("assets/ic_photo.png"),
            onTap: () {},
          ),
          Row(
            children: <Widget>[
              Text(
                "Public",
                style: TextStyle(
                    color: Color(0xFF38316B), fontSize: 14),
              ),
              SizedBox(
                width: 13,
              ),
              CupertinoSwitch(
                value: _enabledPublic,
                onChanged: (value) {
                  this.setState(() {
                    _enabledPublic = value;
                  });
                },),
            ],
          )
        ],
      ),
    );
  }
}
