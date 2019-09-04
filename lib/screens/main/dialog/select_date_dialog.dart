
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';


class SelectDateDialog extends StatefulWidget{
  Function clearDialog;
  SelectDateDialog({this.clearDialog});

  @override
  State<StatefulWidget> createState() => _SelectDateState();

}

class _SelectDateState extends State<SelectDateDialog>{
  DateTime _currentDate = DateTime.now();
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
                            child: Text("Select Date", style: TextStyle( color: Color(0xFF666666), fontSize: 14),)
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
                  CalendarCarousel(
                    height: 230,
                    thisMonthDayBorderColor: Colors.grey,
                    daysHaveCircularBorder: null,
                    onDayPressed: (DateTime date, List) {
                      this.setState(() => _currentDate = date);
                    },
                    dayPadding: 1,
                    childAspectRatio: 2,
                    headerMargin: EdgeInsets.all(0),
                    selectedDateTime: _currentDate,
                    selectedDayButtonColor: Color(0xFFFC8B7D),
                    markedDatesMap: _markedDateMap,
                    selectedDayTextStyle: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                    daysTextStyle: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                    weekendTextStyle: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                    headerTextStyle: TextStyle(fontSize: 16, color: Color(0xFF809EFD)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
