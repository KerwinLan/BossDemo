import 'package:flutter/material.dart';
import 'package:areas/styles.dart';

class MessageCell extends StatelessWidget {
  MessageCell({Key key, this.item}) : super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipOval(
            child: Container(
              color: Colors.grey,
              width: 60,
              height: 60,
            ),
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item['user']['name'],
                        style: TextStyle(
                            fontSize: TextSize.middle, color: Colors.black),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                            '${item['company']['name']}·${item['user']['position']}',
                            style: TextStyle(
                                fontSize: TextSize.small,
                                color: ColorTable.lightGreyText)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    item['last_message']['content'],
                    style: TextStyle(
                        fontSize: TextSize.middle, color: ColorTable.greyText),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 50,
            child: Align(
              alignment: FractionalOffset.topRight,
              child: Text(
                item['last_message']['time'],
                style:
                TextStyle(fontSize: TextSize.small, color: ColorTable.lightGreyText),
              ),
            ),
          )
        ],
      ),
    );
  }
}
