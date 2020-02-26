import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        border: Border(),
        middle:
            Text(title, style: TextStyle(fontSize: 18, color: Colors.black)),
        actionsForegroundColor: Colors.black,
      ),
      child: Container(),
    );
  }
}
