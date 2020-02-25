import 'package:flutter/material.dart';
import 'package:areas/cells/position_cell.dart';
import 'package:flutter/cupertino.dart';
import '../styles.dart';
import 'package:areas/loader.dart';

class PositionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: ColorTable.background,
      navigationBar: CupertinoNavigationBar(
        leading: Align(
          alignment: FractionalOffset.centerLeft,
          child: Text('职位',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TextSize.maximum,
                  fontWeight: FontWeight.bold)),
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                'images/add.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 0.5,
              height: 15,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Image.asset(
                'images/search.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
        backgroundColor: ColorTable.primary,
      ),
      child: PositionBody(),
    );
//    return PositionBody();
  }
}

class PositionBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PositionBodyState();
}

class _PositionBodyState extends State<PositionBody> {
  List<dynamic> _list = [];

  @override
  Widget build(BuildContext context) {
    if (_list.length == 0) {
      Loader.loadList(
          code: Loader.position,
          completed: (res) {
            if (res != null && res.data != null) {
              setState(() {
                _list = res.data;
              });
            }
          });
    }

    return ListView.separated(
        itemBuilder: _itemBuilder,
        separatorBuilder: _separatorBuilder,
        itemCount: _list.length);
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return new Divider(color: Colors.transparent, height: 8);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return PositionCell(item: _list[index]);
  }
}
