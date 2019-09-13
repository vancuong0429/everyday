import 'package:everyday/screens/main/drafts_screen.dart';
import 'package:everyday/screens/main/maps_screen.dart';
import 'package:everyday/screens/main/photos_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF5F5F5),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          child: Column(
            children: <Widget>[
              profileHeader(),
              Expanded(
                child: GridView.count(crossAxisCount: 3,
                padding: EdgeInsets.all(8),
                children: List.generate(choices.length, (index) {
                  return Center(
                    child: ChoiceCard(choice: choices[index], index: index,),
                  );
                },),shrinkWrap: true,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Positioned(
//left: 0,
//top: 405,
//child: InkWell(
//onTap: () {},
//child: Container(
//height: 40,
//decoration: BoxDecoration(
//color: Colors.white,
//borderRadius: BorderRadius.circular(100)
//),
//child: SizedBox(
//child: Center(
//child: Text("FOLLOW", style: TextStyle(color: Colors.green, fontSize: 16),),
//),
//),
//),
//),
//)

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final String icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Favourites', icon: "assets/ic_favorite.png"),
  const Choice(title: 'My Map', icon: "assets/ic_my_map_selected.png"),
  const Choice(title: 'Drafts', icon: "assets/ic_drafts.png"),
  const Choice(title: 'Photos', icon: "assets/ic_photo_selected.png"),
  const Choice(title: 'Videos', icon: "assets/ic_movie_creation.png"),
  const Choice(title: 'Statics', icon: "assets/ic_insert_chart.png"),
];


class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice, this.index}) : super(key: key);
  final Choice choice;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        switch(index) {
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => MapsScreen()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => DraftsScreen()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context) => PhotosScreen()));
            break;
        }
      },
      child: Card(
          color: Colors.white,
          child: Center(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(choice.icon),
                Text(choice.title, style: TextStyle(color: Color(0xFF666666), fontSize: 14)),
              ]
          ),
          )
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height * 0.7);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CustomText extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    var width = 130.0;
    var height = 150.0 - 20;
    var radius = 10.0;
    path.moveTo(0, radius);
    path.arcToPoint(Offset(radius, 0),clockwise: true, radius: Radius.circular(radius));

    path.lineTo(width - radius, 0);
    path.arcToPoint(Offset(width, radius),clockwise: true, radius: Radius.circular(radius));
    path.lineTo(width, height - radius);
    path.arcToPoint(Offset(width - radius, height),clockwise: true, radius: Radius.circular(radius));
    path.lineTo((3 * width / 5), height);
    path.lineTo(width / 2, height + 20);
    path.lineTo((2 * width / 5), height);
    path.lineTo(radius, height);
    path.arcToPoint(Offset(0, height - radius),clockwise: true, radius: Radius.circular(radius));
    path.lineTo(0, radius);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CustomClipTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, 60);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

Widget profileHeader() {

  return Container(
    width: double.infinity,
    height: 400,
    child: Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomClip(),
          child: Container(
              alignment: Alignment(-1,-1),
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFFA508C), Color(0xFFFFC86E)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight)),
              padding: EdgeInsets.only(top: 24),
              child: toolbarProfile()),
        ),
        Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Container(
              height: 260,
              padding: EdgeInsets.all(10),
              child: ClipPath(
                clipper: CustomText(),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 92),
                  child: Column(
                    children: <Widget>[
                      Text("Rejo Varghese", style: TextStyle(color: Color(0xFF666666), fontSize: 24),),
                      SizedBox(height: 14,),
                      Text("There is only one happiness in this life,\nto love and be loved.",
                        style: TextStyle(color: Color(0xFFBBBBBB), fontSize: 14, fontStyle: FontStyle.italic), maxLines: 2,
                        textAlign: TextAlign.center,),
                      SizedBox(height: 28,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("143", style: TextStyle(color: Color(0xFF666666), fontSize: 22, fontWeight: FontWeight.bold),),
                              Text("POSTS", style: TextStyle(color: Color(0xFF999999), fontSize: 11, fontWeight: FontWeight.bold),)
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 34,
                            color: Color(0xFFD8D8D8),
                          ),
                          Column(
                            children: <Widget>[
                              Text("525", style: TextStyle(color: Color(0xFF666666), fontSize: 22, fontWeight: FontWeight.bold),),
                              Text("FOLLOWERS", style: TextStyle(color: Color(0xFF999999), fontSize: 11, fontWeight: FontWeight.bold),)
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 34,
                            color: Color(0xFFD8D8D8),
                          ),
                          Column(
                            children: <Widget>[
                              Text("348", style: TextStyle(color: Color(0xFF666666), fontSize: 22, fontWeight: FontWeight.bold),),
                              Text("FOLLOWING", style: TextStyle(color: Color(0xFF999999), fontSize: 11, fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
        Align(
          alignment: Alignment(0,-0.2),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0x4DFFFFFF), width: 8),
            ),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("https://miro.medium.com/fit/c/64/64/0*BbEuop6sy9fSc9tD.")
                )
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget getItemDiscover() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Color(0xFF979797), width: 0)),
    margin: EdgeInsets.only(left: 16, right: 16),
    child: Padding(
      padding: const EdgeInsets.all(19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Soaring in the Destiny",
            style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
          ),
          Text("03:02PM  | Christina Munoz",
              style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
        ],
      ),
    ),
  );
}

Widget toolbarProfile() {
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
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 17),
            textAlign: TextAlign.center,
          )),
      SizedBox(
        width: 40,
        height: 40,
        child: FlatButton(
          child: Image.asset("assets/ic_setting.png"),
          padding: EdgeInsets.all(0),
          onPressed: () {},
        ),
      ),
    ],
  );
}
