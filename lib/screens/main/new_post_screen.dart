import 'package:everyday/blocs/PostBloc.dart';
import 'package:everyday/screens/main/dialog/add_location_dialog.dart';
import 'package:everyday/screens/main/dialog/add_photo_dialog.dart';
import 'package:everyday/screens/main/dialog/select_date_dialog.dart';
import 'package:everyday/screens/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewPostState();
}

class _NewPostState extends State<NewPostScreen> {
  var showDialog = 0;
  PostBloc _postBloc;
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _postBloc = PostBloc();

  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

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
                AppBarItem(
                    "assets/ic_home_disible.png", "assets/ic_home_disible.png"),
                AppBarItem("assets/ic_calendar_disible.png",
                    "assets/ic_calendar_disible.png"),
                AppBarItem("assets/ic_close_new_post.png",
                    "assets/ic_close_new_post.png"),
                AppBarItem("assets/ic_discover_disible.png",
                    "assets/ic_discover_disible.png"),
                AppBarItem("assets/ic_profile_disible.png",
                    "assets/ic_profile_disible.png")
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
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
                                createPost(titleController.text, contentController.text);
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
                        child: Stack(
                          children: <Widget>[
                            Column(
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
                                    controller: titleController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Add a title",
                                        hintStyle: TextStyle(
                                            color: Color(0xFFC8C8C8))),
                                    style: TextStyle(
                                        fontSize: 24, color: Color(0xFF666666)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 17, top: 15),
                                    child: TextField(
                                      controller: contentController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Start writing…",
                                          hintStyle: TextStyle(
                                              color: Color(0xFFC8C8C8))),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF999999)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            getDialog(showDialog)
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

  void createPost(String title, String content) {
    int currentDate = DateTime.now().millisecondsSinceEpoch;
    _postBloc.createPost(currentDate, title, content).then((value) async {
        Navigator.pop(context);
    });
  }

  closeDialog() {
    print("closeDialog");
    this.setState(() {
      showDialog = 0;
    });
  }

  Widget getDialog(int showDialog) {
    var widget;
    if (showDialog == 0) {
      widget = Container();
    } else if (showDialog == 1) {
      widget = SelectDateDialog(clearDialog: closeDialog,);
    } else if (showDialog == 2) {
      widget = AddLocationDialog(clearDialog: closeDialog,);
    }else if (showDialog == 3) {
      widget = AddPhotoDialog(clearDialog: closeDialog,);
    }

    return Visibility(
      visible: showDialog == 0 ? false : true,
      child: widget,
    );
  }

  Widget getTicker() {
    bool _enabledPublic = false;
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            child: Image.asset(showDialog == 1 ? "assets/ic_calendar_selected.png" : "assets/ic_calendar.png"),
            onTap: () {
              this.setState(() {
                showDialog = 1;
              });
            },
          ),
          InkWell(
            child: Image.asset(showDialog == 2 ? "assets/ic_my_map_selected.png" : "assets/ic_my_map.png"),
            onTap: () {
              this.setState(() {
                showDialog = 2;
              });
            },
          ),
          InkWell(
            child: Image.asset(showDialog == 3 ? "assets/ic_photo_selected.png" : "assets/ic_photo.png"),
            onTap: () {
              this.setState(() {
                showDialog = 3;
              });
            },
          ),
          Row(
            children: <Widget>[
              Text(
                "Public",
                style: TextStyle(color: Color(0xFF38316B), fontSize: 14),
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
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
