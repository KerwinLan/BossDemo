import 'package:flutter/material.dart';
import 'package:areas/styles.dart';

class CompanyCell extends StatelessWidget {
  CompanyCell({Key key, this.item}) : super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 55,
                height: 55,
                color: ColorTable.background,
                child: Image.asset('images/company_placeholder.png',
                    width: 20, height: 20),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      Text(
                        item['address'],
                        style: TextStyle(
                            fontSize: TextSize.middle, color: ColorTable.text),
                      )
                    ],
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 65, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _buildTags(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 65, top: 10),
            height: 0.5,
            color: ColorTable.background,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 65),
            child: RichText(
              text: TextSpan(
                  text: '热招：',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: item['hot_position']['name'],
                        style: TextStyle(color: ColorTable.primary)),
                    TextSpan(text: '等${item['hot_position']['count']}个职位')
                  ]),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildTags() {
    List<Widget> widgets = [];

    List tags = item['tags'];
    for (int i = 0; i < tags.length; i++) {
      widgets.add(Container(
        color: ColorTable.background,
        padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
        margin: EdgeInsets.only(left: i == 0 ? 0 : 8),
        child: Text(tags[i],
            style: TextStyle(fontSize: TextSize.small, color: ColorTable.text)),
      ));
    }
    return widgets;
  }
}
