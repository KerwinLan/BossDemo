import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:areas/cells/message_cell.dart';
import 'package:areas/loader.dart';
import 'package:areas/styles.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: ColorTable.primary,
        leading: Align(
          alignment: FractionalOffset.centerLeft,
          child: Text('消息',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TextSize.maximum,
                  fontWeight: FontWeight.bold)),
        ),
        trailing: Image.asset('images/notify.png', width: 30, height: 30),
      ),
      child: MessagePageBody(),
    );
  }
}

class MessagePageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessagePageBodyState();
}

class _MessagePageBodyState extends State<MessagePageBody> {
  List _messageList = [];

  @override
  Widget build(BuildContext context) {
    if (_messageList.length == 0) {
      Loader.loadList(
          code: Loader.message,
          completed: (res) {
            if (res != null && res.data != null) {
              setState(() {
                _messageList = res.data;
              });
            }
          });
    }
    return ListView.separated(
        itemBuilder: _itemBuilder,
        separatorBuilder: _separatorBuilder,
        itemCount: _messageList.length + 1);
    ;
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return Divider(
      color: Colors.transparent,
      height: 0.5,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return index == 0
        ? MessageHeader()
        : MessageCell(item: _messageList[index - 1]);
  }
}

class MessageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15, top: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(width: 0.5, color: Color(0xFFECECEC))),
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'images/search_grey.png',
                  width: 20,
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text('通过姓名或公司搜索联系人',
                      style: TextStyle(
                          fontSize: TextSize.large,
                          color: ColorTable.lightGreyText)),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('全部',
                        style: TextStyle(
                            fontSize: TextSize.large, color: ColorTable.text)),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('招呼',
                          style: TextStyle(
                              fontSize: TextSize.middle,
                              color: ColorTable.greyText)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('沟通中',
                          style: TextStyle(
                              fontSize: TextSize.middle,
                              color: ColorTable.greyText)),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border:
                          Border.all(width: 0.5, color: Color(0xFFECECEC))),
                  height: 35,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                    child: Text('极速处理',
                        style: TextStyle(
                            fontSize: TextSize.middle,
                            color: ColorTable.lightGreyText)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 0.5,
            color: ColorTable.background,
          )
        ],
      ),
    );
  }
}
