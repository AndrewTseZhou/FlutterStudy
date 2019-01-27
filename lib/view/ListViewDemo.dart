import 'package:flutter/material.dart';
import 'package:flutter_app/view/LayoutWidget.dart';

class ListViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewDemoState();
  }
}

class ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ListView Demo",
        ),
      ),
      body: test5,
    );
  }

  // 测试5
  var test5 = ListView.builder(
    itemCount: 10,
    itemBuilder: (context, i) {
      return Column(
        children: <Widget>[
          test2,
          Divider(
            height: 1,
          ),
        ],
      );
    },
  );

  // 测试6
  // 在index=1下插入
  var test6 = ListView.separated(
    itemBuilder: (context, i) {
      return Column(
        children: <Widget>[
          test4,
        ],
      );
    },
    separatorBuilder: (context, i) {
      return Column(
        children: <Widget>[
          i == 1 ? test2 : Container(),
        ],
      );
    },
    itemCount: 10,
  );

  // 测试7
  // 每隔两个插入
  var test7 = ListView.separated(
    itemBuilder: (context, i) {
      return Column(
        children: <Widget>[
          test4,
        ],
      );
    },
    separatorBuilder: (context, i) {
      return Column(
        children: <Widget>[
          (i + 1) % 2 == 0 ? test2 : Container(),
        ],
      );
    },
    itemCount: 40,
  );
}
