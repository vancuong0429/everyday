import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostMap {
  const PostMap({this.id, this.title, this.lat, this.lng});
  final int id;
  final String title;
  final double lat;
  final double lng;
}

const List<PostMap> postsMap = const <PostMap>[
  const PostMap(id: 1, title: '01', lat: 10.8052611, lng: 106.6290739),
  const PostMap(id: 2, title: '02', lat: 10.8041135, lng: 106.6290588),
  const PostMap(id: 3, title: '03', lat: 10.8062373, lng: 106.6287629),
  const PostMap(id: 4, title: '04', lat: 10.8048587, lng: 106.6285429),
];

class MapsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapsState();
}

class _MapsState extends State<MapsScreen> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.8052611, 106.6290739),
    zoom: 14,
  );
  Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Scaffold(
        body: Container(
          color: Color(0xFFF5F5F5),
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFFA508C), Color(0xFFFFC86E)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  padding: EdgeInsets.only(top: 24),
                  child: getHeaderDrafts(context)),
              Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: _onMapCreated,
                  markers: _markers.values.toSet(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<ByteData> customMarkerData(String title) async {

    final ui.PictureRecorder recorder = ui.PictureRecorder();

    final Canvas canvas = Canvas(recorder);

    final double ratio = ui.window.devicePixelRatio;
    Path path = Path();
    var width = 70.0 * ratio;
    var height = 78.0 * ratio;
    var radius = 4 * ratio;
    var sizeArrow = 10 * ratio;

    var margin = 5.0;
    var widthMargin = width - margin;



    final Paint rectPaint = Paint()
      ..color = Colors.white
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..filterQuality = FilterQuality.high;

    final Paint rectOutlinePaint = Paint()
      ..color = Colors.black
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeCap = ui.StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6);

    final TextSpan textSpan = TextSpan(
      children: [
        TextSpan(style: TextStyle(letterSpacing: 0,
            color: Color(0x8082A0FA), fontSize: ratio * 28),
        text: title)
      ],
    );
    final TextPainter textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    final TextSpan textPostSpan = TextSpan(
      children: [
        TextSpan(style: TextStyle(letterSpacing: 0,
            color: Color(0x8082A0FA), fontSize: ratio * 12),
            text: "POST")
      ],
    );
    final TextPainter textPostPainter = TextPainter(
        text: textPostSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);


    path.moveTo(0 + margin, radius + margin);
    path.arcToPoint(Offset(radius + margin , 0 + margin),clockwise: true, radius: Radius.circular(radius));

    path.lineTo(width - radius, 0 + margin);
    path.arcToPoint(Offset(width, radius + margin),clockwise: true, radius: Radius.circular(radius));
    path.lineTo(width, height - radius);
    path.arcToPoint(Offset(width - radius, height),clockwise: true, radius: Radius.circular(radius));
    path.lineTo((3 * widthMargin / 5), height);
    path.lineTo(widthMargin / 2, height + sizeArrow);
    path.lineTo((2 * widthMargin / 5), height);
    path.lineTo(radius + margin, height);
    path.arcToPoint(Offset(0 + margin, height - radius),clockwise: true, radius: Radius.circular(radius));
    path.lineTo(0 + margin, radius + margin);

    canvas.drawPath(path, rectOutlinePaint);
    canvas.drawPath(path, rectPaint);

    textPainter.layout();
    final Offset textOffset =
    Offset((widthMargin / 2) - (textPainter.width / 2), (height / 2) - (3 * textPainter.height / 4));
    textPainter.paint(canvas, textOffset);

    textPostPainter.layout();
    final Offset textPostOffset =
    Offset((widthMargin / 2) - (textPostPainter.width / 2), (height / 2) +  (textPostPainter.height / 4));
    textPostPainter.paint(canvas, textPostOffset);

    final ui.Picture picture = recorder.endRecording();

    final ByteData pngBytes = await picture
        .toImage(((width) * ratio).toInt(), (height * ratio).toInt())
        .then((image) => image.toByteData(format: ui.ImageByteFormat.png));

    picture.dispose();
    return pngBytes;
  }

  Future<void> _onMapCreated(GoogleMapController controller) async{
    _markers.clear();
    for (final post in postsMap) {
      BitmapDescriptor bitmapDescriptor = await _capturePng(post.title);
      final marker = Marker(
          markerId: MarkerId("${post.id}"),
          position: LatLng(post.lat, post.lng),
          icon: bitmapDescriptor
      );
      _markers["${post.id}"] = marker;
    }
    setState(() {
    });
  }


  Future<BitmapDescriptor> _capturePng(String title) async {
    try {
      ByteData byteData = await customMarkerData(title);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      Uint8List data = Uint8List.view(pngBytes.buffer);
      return BitmapDescriptor.fromBytes(data);
    } catch (e) {
      print("error: $e");
    }
  }
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
            "Maps",
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
