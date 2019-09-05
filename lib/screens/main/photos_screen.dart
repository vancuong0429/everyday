import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';


class PhotosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhotosState();
}

class _PhotosState extends State<PhotosScreen> {
  static const int _kItemCount = 100;
  final List<IntSize> _sizes = _createSizes(_kItemCount).toList();
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
                child: getHeaderPhotos(context)),
            Expanded(
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
                            child: Text("January 2017", style: TextStyle(color: Color(0xFF666666), fontSize: 14),),
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
                                child: Image.asset("assets/ic_calendar_selected.png", color: Color(0xFF82A0FA),),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: StaggeredGridView.countBuilder(
                      primary: false,
                      crossAxisCount: 4,
                      mainAxisSpacing: 11,
                      crossAxisSpacing: 11,
                      itemCount: _kItemCount,
                      padding: EdgeInsets.all(16),
                      itemBuilder: (context, index) => new _Tile(index, _sizes[index]),
                      staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
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

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

List<IntSize> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(count,
          (i) => new IntSize((rnd.nextInt(500) + 200), rnd.nextInt(800) + 200));
}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

class _Tile extends StatelessWidget {
  const _Tile(this.index, this.size);

  final IntSize size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Stack(
          children: <Widget>[
            //new Center(child: new CircularProgressIndicator()),
            new Center(
              child: new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://picsum.photos/${size.width}/${size.height}/',
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget getHeaderPhotos(BuildContext context) {
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
            "Photos",
            style: TextStyle(color: Colors.white, fontSize: 17),
            textAlign: TextAlign.center,
          )),
    ],
  );
}
