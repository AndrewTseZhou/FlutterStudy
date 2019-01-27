import 'package:flutter/material.dart';
import 'package:flutter_app/utils/LayoutUtils.dart';

// TabBar
var titles = ["Test1", "Test2", "Test3", "Test4"];
var tabBar = TabBar(
  labelStyle: TextStyle(fontSize: 20),
  labelColor: Color(0xffF64C19),
  unselectedLabelColor: Colors.white,
  tabs: titles.map(
    (item) {
      return Container(
        alignment: AlignmentDirectional.center,
        child: Text(item),
        height: 40,
      );
    },
  ).toList(),
);

// TabBarView
var itemsArr = [test1, test2, test3, test4];
var tabBarView = TabBarView(
  children: itemsArr.map(
    (item) {
      return item;
    },
  ).toList(),
);

// BottomNavigationBar
class ItemBean {
  String title;
  IconData iconId;

  ItemBean(this.title, this.iconId);
}

var iconInfoList = [
  ItemBean("首页", Icons.home),
  ItemBean("消息", Icons.comment),
  ItemBean("动态", Icons.toys),
  ItemBean("联系人", Icons.contacts),
];

int curIndex = 0;
var bottomNavigationBar = BottomNavigationBar(
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
  },
);

// Drawer
var drawer = Drawer(
  elevation: 5,
  child: Container(
    alignment: AlignmentDirectional.center,
    color: Color(0xff99C6F9),
    child: Text(
      "Andrew Tse",
      style: TextStyle(fontSize: 30),
    ),
  ),
);

// SnackBar
var snackBar = SnackBar(
  backgroundColor: Color(0xffFB6431),
  content: Text('Hello!'),
  duration: Duration(seconds: 1),
  action: SnackBarAction(
    label: '确定',
    onPressed: () {
      print("Andrew Tse");
    },
  ),
);

// BottomSheet
var bottomSheet = BottomSheet(
  onClosing: () {},
  builder: (context) => Container(
        color: Color(0xffABF5E0),
        child: Wrap(
          children: <Widget>[
            Center(child: Text('绝域从军计惘然，')),
            Center(child: Text('东南幽恨满词笺。')),
            Center(child: Text('一箫一剑平生意，')),
            Center(child: Text('负尽狂名十五年。')),
          ],
        ),
      ),
);

// 测试1
var rowLine1 = Row(
  children: <Widget>[
    Icon(
      Icons.extension,
      color: Colors.blue,
    ),
    Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          "好友微视",
          style: TextStyle(fontSize: 18),
        ),
      ),
    ),
    Icon(Icons.arrow_forward),
  ],
);

var test1 = Container(
  color: Colors.white,
  padding: EdgeInsets.all(15),
  child: rowLine1,
);

// 测试2
var headImage = Image.asset(
  "images/test.png",
  width: 45,
  height: 45,
);

var center2 = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text(
      "心如止水",
      style: commonStyle,
    ),
    Text(
      "一箫一剑平生意，负尽狂名十五年",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: infoStyle,
      textAlign: TextAlign.start,
    ),
  ],
);

var end2 = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text("06:00"),
    Icon(
      Icons.visibility_off,
      size: 20,
      color: Color(0xff999999),
    ),
  ],
);

var rowLine2 = Row(
  children: <Widget>[
    Padding(
      child: headImage,
      padding: EdgeInsets.all(5),
    ),
    Expanded(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: center2,
      ),
    ),
    end2,
  ],
);

var test2 = Container(
  height: 70,
  color: Colors.white,
  padding: EdgeInsets.all(5),
  child: rowLine2,
);

// 测试3
var headImage3 = Image.asset(
  "images/test.png",
  width: 50,
  height: 50,
);

var center3 = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text("Andrew Tse", style: bigStyle),
    Row(
      children: <Widget>[
        Icon(
          Icons.next_week,
          size: 15,
        ),
        pd(
          Text("神之子"),
          l: 5,
        ),
      ],
    ),
    Row(
      children: <Widget>[
        Icon(
          Icons.keyboard,
          size: 15,
        ),
        pd(
          Text("海的彼岸有我未曾见证的风采"),
          l: 5,
        ),
      ],
    ),
  ],
);

var end3 = Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: <Widget>[
    Row(
      children: <Widget>[
        Icon(
          Icons.language,
          size: 15,
        ),
        Icon(
          Icons.local_pharmacy,
          size: 15,
        ),
        Icon(
          Icons.person_pin_circle,
          size: 15,
        ),
      ],
    ),
    bg(
      pdhv(
        Text(
          "编辑",
          style: btnStyle,
        ),
        h: 10,
        v: 3,
      ),
      Colors.blueAccent,
    ),
  ],
);

var rowLine3 = Row(
  children: <Widget>[
    pda(headImage3, 5),
    Expanded(
      child: pda(center3, 5),
    ),
    pda(
      end3,
      10,
    ),
  ],
);

var test3 = Card(
  child: Container(
    height: 95,
    color: Colors.white,
    padding: EdgeInsets.all(5),
    child: rowLine3,
  ),
);

// 测试4
var line4 = Row(
  children: <Widget>[
    Image.asset(
      "images/test.png",
      width: 20,
      height: 20,
    ),
    Expanded(child: pd(Text("Andrew Tse"), l: 5)),
    Text(
      "Flutter/Dart",
      style: infoStyle,
    ),
  ],
);

var centerLeft = Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Text(
      "Flutter第4天--基础控件(下)+Flex布局详解",
      style: littelStyle,
      maxLines: 2,
    ),
    pd(
      Text(
        "1.2：优雅地查看：图片的适应模式--BoxFit1.3：优雅地查看：颜色混合模式--colorBlendMode",
        style: infoStyle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      t: 5,
    ),
  ],
);

var center4 = Row(
  children: <Widget>[
    Expanded(child: pda(centerLeft, 5)),
    Image.asset(
      "images/test.png",
      width: 80,
      height: 80,
      fit: BoxFit.fitHeight,
    ),
  ],
);

var end4 = Row(
  children: <Widget>[
    Icon(
      Icons.grade,
      color: Colors.green,
      size: 20,
    ),
    Text(
      "1000W",
      style: infoStyle,
    ),
    pd(
      Icon(
        Icons.tag_faces,
        color: Colors.lightBlueAccent,
        size: 20,
      ),
      l: 15,
      r: 5,
    ),
    Text("2000W", style: infoStyle),
  ],
);

var rowLine4 = Column(
  children: <Widget>[
    line4,
    Expanded(
      child: center4,
    ),
    end4,
  ],
);

var test4 = Card(
  child: Container(
    height: 160,
    color: Colors.white,
    padding: EdgeInsets.all(10),
    child: rowLine4,
  ),
);
