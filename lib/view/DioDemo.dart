import 'package:flutter/material.dart';
import 'package:flutter_app/model/UserBean.dart';
import 'package:flutter_app/utils/NetUtils.dart';

class DioDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DioDemoState();
  }
}

class DioDemoState extends State<DioDemo> {
  String name = "";
  String email = "";
  List<String> picList = <String>[""];

  @override
  void initState() {
    super.initState();

    getContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Demo"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Image(
                image: NetworkImage(picList[0]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getContent() {
    NetUtils.get(
      "http://www.mocky.io/v2/5c4d86373700002b0bb043af",
      (data) {
        UserBean user = UserBean.fromJson(data);
        setState(
          () {
            name = user.name;
            email = user.email;
            picList = user.pics;
          },
        );
      },
      errorCallBack: (errorMsg) {
        print("error:" + errorMsg);
      },
    );
  }
}
