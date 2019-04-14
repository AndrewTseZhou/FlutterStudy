import 'package:flutter/material.dart';
import 'package:flutter_app/view/dio_demo.dart';
import 'package:flutter_app/view/gesture_detector_demo.dart';
import 'package:flutter_app/view/layout_demo1.dart';
import 'package:flutter_app/view/layout_demo2.dart';
import 'package:flutter_app/view/list_file_page.dart';
import 'package:flutter_app/view/list_view_demo.dart';
import 'package:flutter_app/view/random_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: buildButtons(),
    );
  }

  Widget buildButtons() {
    return GridView.count(
      crossAxisCount: 5,
      children: <Widget>[
        RaisedButton(
          padding: EdgeInsets.all(5),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return new RandomWords();
                },
              ),
            );
          },
          child: Text(
            "RandomWords Demo",
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          padding: EdgeInsets.all(5),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return new LayoutDemo();
                },
              ),
            );
          },
          child: Text(
            "Layout Demo",
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          padding: EdgeInsets.all(5),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return new ListViewDemo();
                },
              ),
            );
          },
          child: Text(
            "ListView Demo",
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          padding: EdgeInsets.all(5),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return new ListFilePage();
                },
              ),
            );
          },
          child: Text(
            "File Demo",
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          padding: EdgeInsets.all(5),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return new DioDemo();
                },
              ),
            );
          },
          child: Text(
            "Dio Demo",
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          padding: EdgeInsets.all(5),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return new LayoutDemo2();
                },
              ),
            );
          },
          child: Text(
            "Layout Demo2",
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          padding: EdgeInsets.all(5),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return new GestureDetectorDemo();
                },
              ),
            );
          },
          child: Text(
            "GestureDetector Demo",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
