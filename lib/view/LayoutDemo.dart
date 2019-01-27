import 'package:flutter/material.dart';
import 'package:flutter_app/view/LayoutWidget.dart';

class LayoutDemo extends StatefulWidget {
  @override
  createState() => LayoutState();
}

class LayoutState extends State<LayoutDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Layout Demo"),
          bottom: tabBar,
        ),
        body: tabBarView,
        drawer: drawer,
//        bottomSheet: bottomSheet,
        bottomNavigationBar: BottomNavigationBar(
          items: iconInfoList.map(
            (item) {
              return BottomNavigationBarItem(
                title: Text(
                  item.title,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                icon: Icon(
                  item.iconId,
                ),
                backgroundColor: Color(0xff49B1FB),
              );
            },
          ).toList(),
          currentIndex: curIndex,
          onTap: (position) {
            curIndex = position;
            setState(() {});
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).showSnackBar(snackBar);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
      length: 4,
    );
  }
}
