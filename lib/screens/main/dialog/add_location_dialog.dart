
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class AddLocation {
  const AddLocation({this.lat, this.lng, this.place});

  final double lat;
  final double lng;
  final String place;
}

const List<AddLocation> addLocations = const <AddLocation>[
  const AddLocation(lat: 0, lng: 0, place: "Mumbai"),
  const AddLocation(lat: 0, lng: 0, place: "New Delhi"),
  const AddLocation(lat: 0, lng: 0, place: "Ladhak"),
  const AddLocation(lat: 0, lng: 0, place: "Nagpur"),
  const AddLocation(lat: 0, lng: 0, place: "HoChiMinh"),
  const AddLocation(lat: 0, lng: 0, place: "HaNoi"),
  const AddLocation(lat: 0, lng: 0, place: "Mumbai"),
];

class AddLocationDialog extends StatefulWidget{
  Function clearDialog;

  AddLocationDialog({Key key, this.clearDialog}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddLocationState();

}

class _AddLocationState extends State<AddLocationDialog> with AutomaticKeepAliveClientMixin<AddLocationDialog>{
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    EventList<Event> _markedDateMap = new EventList<Event>();
    _markedDateMap.add(DateTime(2019, 8, 1), null);
    _markedDateMap.add(DateTime(2019, 8, 2), null);
    _markedDateMap.add(DateTime(2019, 8, 3), null);
    return Container(
      color: Color(0x80000000),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  color: Colors.white
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45,
                        child: Align(
                            alignment: Alignment(0, 0),
                            child: Text("Add Location", style: TextStyle( color: Color(0xFF666666), fontSize: 14),)
                        ),
                      ),
                      Align(
                        alignment: Alignment(1,0),
                        child: Padding(
                          padding: const EdgeInsets.all(11),
                          child: InkWell(
                            child: SizedBox(
                              child: Image.asset("assets/ic_clear.png"),
                            ),
                            onTap: () {
                              widget.clearDialog();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 0.5,
                    color: Color(0xFFF1F1F1),
                  ),
                  Container(
                    height: 230,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          bottom: 0,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                            onMapCreated: (GoogleMapController controller) {

                            },
                          ),
                        ),
                        Positioned(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              border: Border.all(color: Color(0x1A000000)),
                              color: Colors.white
                            ),
                            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 16.5,),
                                Image.asset("assets/ic_search.png"),
                                SizedBox(width: 8,),
                                Text("Search Location", style: TextStyle(color: Color(0xFF7A797B), fontSize: 14),)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 35,
                            margin: EdgeInsets.only(bottom: 16),
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 10,);
                              },
                              itemBuilder: (context, index) {
                              return getItemPlace(index);
                            },
                            itemCount: addLocations.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getItemPlace(int index) {
    return Container(
      margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: index == (addLocations.length - 1) ? 16 : 0),
      child: Text(addLocations[index].place, style: TextStyle(color: Color(0xFF82A0FA), fontSize: 14),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF82A0FA), width: 1),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 16, right: 16),
    );
  }

  @override
  bool get wantKeepAlive => true;

}
