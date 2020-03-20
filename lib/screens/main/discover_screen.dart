import 'package:everyday/blocs/PostBloc.dart';
import 'package:everyday/provider/PostEntity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverState();
}

class _DiscoverState extends State<DiscoverScreen> {
  PostBloc _postBloc = PostBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postBloc.getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFA508C), Color(0xFFFFC86E)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
                padding: EdgeInsets.only(top: 24),
                child: getHeaderDiscover()),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Color(0xFFF5F5F5),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 44,
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            bottom: 0,
                            top: 0,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 16, top: 14, bottom: 14),
                              child: Text(
                                "04 January 2017",
                                style: TextStyle(
                                    color: Color(0xFF666666), fontSize: 14),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 16,
                            bottom: 0,
                            top: 0,
                            child: Container(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  child: Image.asset(
                                      "assets/ic_calendar_selected.png"),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder(builder: (context, postSnap) {
                        if (postSnap.data != null) {
                          return ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                    color: Colors.transparent,
                                    height: 16,
                                  ),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                PostEntity post = postSnap.data[index];
                                return getItemDiscover(
                                    post.title, post.date);
                              },
                              itemCount: postSnap.data.length);
                        } else {
                          return Container();
                        }
                      },
                      stream: _postBloc.postStream),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _postBloc.dispose();
  }
}

Widget getItemDiscover(String title, int date) {
  var format = new DateFormat('HH:mm a');
  var dateStr = DateTime.fromMicrosecondsSinceEpoch(date * 1000);
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Color(0xFF979797), width: 0)),
    margin: EdgeInsets.only(left: 16, right: 16),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://miro.medium.com/fit/c/64/64/0*BbEuop6sy9fSc9tD."),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
                textAlign: TextAlign.left,
              ),
              Text("${format.format(dateStr)}  | Christina Munoz",
                  style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget getHeaderDiscover() {
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
            "Discover",
            style: TextStyle(color: Colors.white, fontSize: 17),
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
