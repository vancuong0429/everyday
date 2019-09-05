import 'package:flutter/material.dart';


class DraftsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DraftState();
}

class _DraftState extends State<DraftsScreen> {
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
                child: getHeaderDrafts(context)),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Color(0xFFF5F5F5),
                child: Column(
                  children: <Widget>[
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
    margin: EdgeInsets.only(left: 16, right: 16),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(
            color: Color(0xFF979797),
            width: 0
        )
    ),
    child: FlatButton(
      child: Row(
        children: <Widget>[
          RichText(text: TextSpan(
              children: <TextSpan> [
                TextSpan(text: "03", style: TextStyle(fontSize: 28, color: Color(0xFF82A0FA), fontWeight: FontWeight.bold, letterSpacing: 1)),
                TextSpan(text: "\n"),
                TextSpan(text: "JAN", style: TextStyle(fontSize: 12, color: Color(0xFF82A0FA), fontWeight: FontWeight.bold,wordSpacing: 1)),
              ]
          ), textAlign: TextAlign.center, softWrap: true,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("A slow but sure start.", style: TextStyle(fontSize: 16, color: Color(0xFF666666)),),
                  Text("Tuesday, 11:30 AM", style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
                ],
              ),
            ),
          )
        ],
      ), onPressed: () {
    },
    ),
  );
}

Widget getHeaderDrafts(BuildContext context) {
  return Row(
    children: <Widget>[
      SizedBox(
        width: 40,
        height: 40,
        child: FlatButton(
          child: Image.asset("assets/ic_arrow_back.png"),
          padding: EdgeInsets.all(0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      Expanded(
          flex: 1,
          child: Text(
            "Drafts",
            style: TextStyle(color: Colors.white, fontSize: 17),
            textAlign: TextAlign.center,
          )),
      SizedBox(
        width: 40,
        height: 40,
      ),
    ],
  );
}
