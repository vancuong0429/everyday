import 'package:everyday/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        child: Image.asset("assets/ic_add.png"),
        backgroundColor: Color(0xFF82A0FA),
        onPressed: () {
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomAppBar(height: 48, iconSize: 24, items: [
        AppBarItem("assets/ic_home.png", "assets/ic_home_selected.png"),
        AppBarItem("assets/ic_calendar.png", "assets/ic_calendar_selected.png"),
        AppBarItem("assets/ic_discover.png", "assets/ic_discover_selected.png"),
        AppBarItem("assets/ic_profile.png", "assets/ic_profile_selected.png")
      ],),
    );
  }
}