import 'package:flutter/material.dart';

class DismissibleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> items = new List<String>.generate(30, (i) => "列表项 ${i + 1}");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '滑动删除示例',
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return Dismissible(
                key: Key(item),
                onDismissed: (direction) {
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                      '$item 被删除了',
                    ),
                  ));
                },
                child: ListTile(
                  title: Text('$item'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
