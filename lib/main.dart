import 'package:flutter/material.dart';
import 'package:flutter_app/view/RandomWords.dart';

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
      ],
    );
  }
}
