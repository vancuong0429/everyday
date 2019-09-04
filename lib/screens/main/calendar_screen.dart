import 'package:everyday/screens/main/home_screen.dart';
import 'package:everyday/screens/main/personal_post_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;


class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<CalendarScreen> {
  DateTime _currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    EventList<Event> _markedDateMap = new EventList<Event>();
    _markedDateMap.add(DateTime(2019, 8, 1), null);
    _markedDateMap.add(DateTime(2019, 8, 2), null);
    _markedDateMap.add(DateTime(2019, 8, 3), null);
    return Scaffold(
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFA508C), Color(0xFFFFC86E)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
                padding: EdgeInsets.only(top: 24),
                child: getHeaderCalendar()),
            Expanded(
              child: Container(
                color: Colors.white,
                child: CalendarCarousel(
                  thisMonthDayBorderColor: Colors.grey,
                  daysHaveCircularBorder: null,
                  onDayPressed: (DateTime date, List) {
                    this.setState(() => _currentDate = date);
                  },
                  selectedDateTime: _currentDate,
                  selectedDayButtonColor: Color(0xFFFC8B7D),
                  markedDatesMap: _markedDateMap,
                  daysTextStyle: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                  weekendTextStyle: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                  headerTextStyle: TextStyle(fontSize: 16, color: Color(0xFF809EFD)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, top: 16, right: 16),
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("03", style: TextStyle(fontSize: 28, color: Color(0xFF82A0FA), fontWeight: FontWeight.bold)),
                        Text("JAN", style: TextStyle(fontSize: 12, color: Color(0xFF82A0FA), fontWeight: FontWeight.bold)),
                      ],
                    ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalPostViewScreen()));
              },
              ),
            ),
            SizedBox(height: 38,)
          ],
        ),
      ),
    );
  }
}

Widget getHeaderCalendar() {
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
            "Calendar",
            style: TextStyle(color: Colors.white, fontSize: 17),
            textAlign: TextAlign.center,
          )),
      SizedBox(
        width: 40,
        height: 40,
        child: FlatButton(
          child: Image.asset("assets/ic_view_day.png"),
          padding: EdgeInsets.all(0),
          onPressed: () {},
        ),
      ),
    ],
  );
}
