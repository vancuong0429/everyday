import 'package:flutter/material.dart';


class DiscoverScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverState();
}

class _DiscoverState extends State<DiscoverScreen> {
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
                             margin: EdgeInsets.only(left: 16, top: 14, bottom: 14),
                             child: Text("04 January 2017", style: TextStyle(color: Color(0xFF666666), fontSize: 14),),
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
                                 child: Image.asset("assets/ic_calendar_selected.png"),
                                 onPressed: () {},
                               ),
                             ),
                           ),
                         )
                       ],
                     ),
                   ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.transparent,
                          height: 16,
                        ),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                        return getItemDiscover();
                      }, itemCount: 20,),
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
}

Widget getItemDiscover() {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(
              color: Color(0xFF979797),
              width: 0
          )
      ),
    margin: EdgeInsets.only(left: 16, right: 16),
    child: Padding(
      padding: const EdgeInsets.all(19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Soaring in the Destiny", style: TextStyle(fontSize: 16, color: Color(0xFF666666)),),
          Text("03:02PM  | Christina Munoz", style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
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
