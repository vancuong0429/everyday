import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  GlobalKey _globalKey = new GlobalKey();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.8052611, 106.6290739),
    zoom: 14.4746,
  );
  Map<String, Marker> _markers = {};
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
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    for (final post in postsMap) {
      print("start");
      BitmapDescriptor bitmapDescriptor = await _capturePng();
      print("continue");
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
    print("data: _capturePng");
    try {
      RenderRepaintBoundary boundary =
      _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      Uint8List data = Uint8List.view(pngBytes.buffer);
      var bs64 = base64Encode(pngBytes);
      print("data: ${pngBytes}");
      print("bs64: ${bs64}");

      return BitmapDescriptor.fromBytes(data);
    } catch (e) {
      print("error: ${e}");
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
