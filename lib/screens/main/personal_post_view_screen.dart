import 'package:flutter/material.dart';

class PersonalPostViewScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PersonalPostViewState();
}

class _PersonalPostViewState extends State<PersonalPostViewScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 250),
              pinned: true,
              floating: false,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 16,),
                        Text('Posted at 11:30 AM | Tuesday, 1 Jan, 2017.', style: TextStyle(color: Color(0xFF999999), fontSize: 12),),
                        SizedBox(height: 31,),
                        Text(
                          "1 Description that is too long in text format(Here Data is coming from API) jdlksaf j klkjjflkdsjfkddfdfsdfds " +
                              "2 Description that is too long in text format(Here Data is coming from API) d fsdfdsfsdfd dfdsfdsf sdfdsfsd d " +
                              "3 Description that is too long in text format(Here Data is coming from API)  adfsfdsfdfsdfdsf   dsf dfd fds fs" +
                              "4 Description that is too long in text format(Here Data is coming from API) dsaf dsafdfdfsd dfdsfsda fdas dsad" +
                              "5 Description that is too long in text format(Here Data is coming from API) dsfdsfd fdsfds fds fdsf dsfds fds " +
                              "6 Description that is too long in text format(Here Data is coming from API) asdfsdfdsf fsdf sdfsdfdsf sd dfdsf" +
                              "7 Description that is too long in text format(Here Data is coming from API) df dsfdsfdsfdsfds df dsfds fds fsd" +
                              "8 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "9 Description that is too long in text format(Here Data is coming from API)" +
                              "10 Description that is too long in text format(Here Data is coming from API)",
                          style: new TextStyle(
                            fontSize: 14.0, color: Color(0xFF999999)
                          ),
                        )
                      ],
                    ),
                  );
                },
                childCount: 1
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          "https://images.vov.vn/w990/uploaded/1nuq1sd3egocrb7fgmumzw/2018_05_15/1_RGZQ.jpg",
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 11,
          child: Opacity(
            opacity: 1,
            child: Container(
              padding: EdgeInsets.only(left: 12),
              child: Row(
                children: <Widget>[
                  InkWell(child: Image.asset("assets/ic_arrow_back.png"),
                  onTap: () {
                    Navigator.pop(context);
                  },)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 3 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Container(
              alignment: Alignment.center,
              child: Column(
               children: <Widget>[
                 Container(
                     child: Text("1 JAN", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                   padding: EdgeInsets.only(left: 16, right: 16, top: 9, bottom: 9),
                   decoration: BoxDecoration(
                       gradient: LinearGradient(
                           colors: [Color(0xFFFA508C), Color(0xFFFFC86E)],
                           begin: Alignment.bottomLeft,
                           end: Alignment.topRight),
                     borderRadius: BorderRadius.circular(2),
                     border: Border.all(color: Color(0xFF979797), width: 0)
                   ),
                 ),
                 SizedBox(height: 16,),
                 Text("What a way to start \nthe year :)", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
               ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}