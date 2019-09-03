
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


class AddPhotoDialog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddPhotoState();

}

class _AddPhotoState extends State<AddPhotoDialog>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 0.5,
                    color: Color(0xFFF1F1F1),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
