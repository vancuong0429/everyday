import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  double height;
  double iconSize;
  List<AppBarItem> items = new List();
  ValueChanged navigationTapped;

  CustomAppBar({this.height, this.iconSize, this.items, this.navigationTapped});

  @override
  State<StatefulWidget> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.navigationTapped(index);
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTapItem(appBarItem: widget.items[index], index: index, onPressed: _updateIndex);
    });
    if (items.length %2 == 0) {
      items.insert(items.length >> 1, SizedBox( height: widget.height, width: widget.iconSize,));
    }
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTapItem({AppBarItem appBarItem, int index, ValueChanged<int> onPressed}){
    String icon = _selectedIndex == index ? appBarItem.iconSelected : appBarItem.iconNormal;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: InkWell(child: Image.asset(icon), onTap: () {
          onPressed(index);
        },),
      ),
    );
  }

}


class AppBarItem{
  String iconNormal;
  String iconSelected;
  AppBarItem(this.iconNormal, this.iconSelected);
}