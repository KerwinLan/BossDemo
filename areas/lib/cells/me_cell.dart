import 'package:flutter/material.dart';
import 'package:areas/styles.dart';

class MeCellItem {
  MeCellItem({this.type, this.placeholder, this.title, this.icon});

  static int cell = 0;
  static int separator = 1;

  final String title;

  final String placeholder;

  final int type;

  final IconData icon;
}

class MeCell extends StatelessWidget {
  MeCell({Key key, this.item}) : super(key: key);

  final MeCellItem item;

  @override
  Widget build(BuildContext context) {
    return item.type == MeCellItem.separator
        ? separatorBody()
        : Container(
            padding: EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 20),
            color: Colors.white,
            child: cellBody(),
          );
  }

  Widget cellBody() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(item.icon, color: ColorTable.text, size: 20),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(item.title,
                    style: TextStyle(
                        color: ColorTable.text, fontSize: TextSize.large)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(item.placeholder,
                  style: TextStyle(
                      color: ColorTable.lightGreyText, fontSize: TextSize.middle)),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Image.asset('images/right.png', width: 15, height: 15),
              )
            ],
          )
        ],
      );

  Widget separatorBody() => Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        height: 15,
        alignment: Alignment.center,
        color: Colors.white,
        child: Container(
          color: ColorTable.background,
          height: 0.5,
        ),
      );
}
