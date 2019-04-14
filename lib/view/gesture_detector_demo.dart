import 'package:flutter/material.dart';

class GestureDetectorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '手势检测示例',
        ),
      ),
      body: Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('按钮被点击'),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('测试按钮'),
            ),
          );
        },
      ),
    );
  }
}
