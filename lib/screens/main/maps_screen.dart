import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
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
  const PostMap(id: 1, title: '01 POST', lat: 10.8052611, lng: 106.6290739),
  const PostMap(id: 2, title: '02 POST', lat: 10.8041135, lng: 106.6290588),
  const PostMap(id: 3, title: '03 POST', lat: 10.8062373, lng: 106.6287629),
  const PostMap(id: 4, title: '04 POST', lat: 10.8048587, lng: 106.6285429),
];

class MapsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapsState();
}

class _MapsState extends State<MapsScreen> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.8052611, 106.6290739),
    zoom: 14.4746,
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

  Future<prefix0.Image> loadAsset(String path) async {
    return await Image(image: AssetImage(path),);
  }

  Future<ByteData> customBusMarkerData(
      String assetImagePath, String busNumber) async {
//    final Offset imageOffset =
//    Offset(18.0 + (2.5 * (busNumber.length - 1.0)), 50);
    final Offset textOffset =
    Offset(39.5 - (12.75 * (busNumber.length - 1.0)), 0.0);

    final ui.PictureRecorder recorder = ui.PictureRecorder();

    final Canvas canvas = Canvas(recorder);

//    final Paint imagePaint = Paint()
//      ..isAntiAlias = true
//      ..filterQuality = FilterQuality.high;

    final Paint rectPaint = Paint()
      ..color = Colors.white
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..filterQuality = FilterQuality.high;

    final Paint rectOutlinePaint = Paint()
      ..color = Colors.red
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = ui.StrokeCap.round
      ..filterQuality = FilterQuality.high;

    final TextSpan textSpan = TextSpan(
      style: const TextStyle(
          color: Color(0xFF82A0FA), fontSize: 28, fontWeight: FontWeight.bold),
      text: busNumber,
    );
    final TextPainter textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
//    final ui.Image image =

//    final Size sourceImageSize =
//    Size(50, 50);
//    final Size wantedImageSize = sourceImageSize * 1.5;
//
//    final ui.Rect inputRect = Offset.zero & sourceImageSize;
//    final ui.Rect outputRect = imageOffset & wantedImageSize;
//
//    final FittedSizes sizes =
//    applyBoxFit(BoxFit.contain, sourceImageSize, wantedImageSize);

//    final Rect inputSubrect = Alignment.center.inscribe(sizes.source, inputRect);
//
//    final Rect outputSubrect =
//    Alignment.center.inscribe(sizes.destination, outputRect);

//    canvas.drawRRect(
//        RRect.fromLTRBAndCorners(
//          0.0,
//          0.0,
//          105.0 + (busNumber.length * 5.75),
//          120.0,
//          bottomRight: const Radius.circular(25),
//          topLeft: const Radius.circular(25),
//        ),
//        rectPaint);

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

//    path.relativeConicTo(0, 0, width, 0, 10);
//    path.relativeConicTo(width, 0, width, height, 10);
//    path.relativeConicTo(width / 2, height, width, height, 10);
//    path.addRRect(
//        RRect.fromRectAndRadius(Rect.fromLTWH(0.0,
//          0.0,
//          width,
//          height,), Radius.circular(16))
//    );
//    path.conicTo((3*width/4), height, (width/4), height, 1);
    canvas.drawPath(path, rectOutlinePaint);
//    canvas.drawPath(path, rectPaint);
//    canvas.drawRRect(
//        RRect.fromLTRBAndCorners(
//          0.0,
//          0.0,
//          105.0 + (busNumber.length * 5.75),
//          120.0,
//          bottomRight: const Radius.circular(4),
//          topLeft: const Radius.circular(4),
//          topRight: const Radius.circular(4),
//          bottomLeft: const Radius.circular(4)
//        ),
//        rectOutlinePaint);

//    canvas.drawImageRect(image, inputSubrect, outputSubrect, imagePaint);
//    canvas.drawRect(rect, paint)

    textPainter.layout();
    textPainter.paint(canvas, textOffset);

    final ui.Picture picture = recorder.endRecording();

    final ByteData pngBytes = await picture
        .toImage(512, 512)
        .then((image) => image.toByteData(format: ui.ImageByteFormat.png));

    picture.dispose();
    return pngBytes;
  }

  Future<void> _onMapCreated(GoogleMapController controller) async{
    _markers.clear();
    for (final post in postsMap) {
      BitmapDescriptor bitmapDescriptor = await _capturePng();
      final marker = Marker(
          markerId: MarkerId("${post.id}"),
          position: LatLng(post.lat, post.lng),
          infoWindow: InfoWindow(
            title: post.title,
          ),
          icon: bitmapDescriptor
      );
      _markers["${post.id}"] = marker;
    }
    setState(() {
    });
  }


  Future<BitmapDescriptor> _capturePng() async {

//    ui.Image image;
    bool catched = true;
//    RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
//    print("data: ${boundary.debugNeedsPaint}");
//    if(!boundary.debugNeedsPaint) {
//      image = await boundary.toImage();
//      catched = true;
//    } else{
//      catched = false;
//      Timer(Duration(milliseconds: 1), () {
//        _capturePng();
//      });
//    }
    if (catched) {
      try {
        ByteData byteData = await customBusMarkerData("", "POSTS");
        Uint8List pngBytes = byteData.buffer.asUint8List();
        String base64Image = base64Encode(pngBytes);
        Uint8List data = Uint8List.view(pngBytes.buffer);
        return BitmapDescriptor.fromBytes(data);
      } catch (e) {
        print("error: ${e}");
      }

    }
  }

  void _createMarker(String mkId, double lat, double lng) {
    setState(() {
      _markers[mkId] = Marker(
        markerId: MarkerId(mkId),
        position: LatLng(lat, lng),
      );
    });
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
