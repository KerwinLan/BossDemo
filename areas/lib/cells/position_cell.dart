import 'package:flutter/material.dart';
import 'package:areas/styles.dart';

class PositionCell extends StatelessWidget {
  PositionCell({Key key, @required this.item}) : super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  item['name'],
                  style: TextStyle(fontSize: TextSize.large, color: Colors.black),
                ),
                Text(item['salary'],
                    style: TextStyle(
                        fontSize: TextSize.middle, color: ColorTable.primary))
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item['company']['name'],
                    style: TextStyle(
                        fontSize: TextSize.middle, color: ColorTable.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Text(
                      item['company']['finance'],
                      style: TextStyle(
                          fontSize: TextSize.middle, color: ColorTable.text),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                children: _buildTags(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/avatar.png', width: 20, height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      '${item['recruiter']['name']} · ${item['recruiter']['position']}',
                      style: TextStyle(fontSize: TextSize.small, color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTags() {
    List<Widget> widgets = [];

    List tags = item['tags'];
    for (int i = 0; i < tags.length; i++) {
      widgets.add(Container(
        margin: EdgeInsets.only(left: i == 0 ? 0 : 10),
        padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
        color: ColorTable.background,
        child: Text(tags[i],
            style: TextStyle(fontSize: TextSize.small, color: ColorTable.text)
            ),
      ));
    }
    return widgets;
  }
}
