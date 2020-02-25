import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'sliver_delegate.dart';
import 'package:areas/cells/me_cell.dart';
import 'package:areas/styles.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[MePageBody(), actions(context)],
    ));
  }

  Widget actions(BuildContext context) => Container(
      width: double.infinity,
      height: MediaQuery.of(context).padding.top + 44,
      alignment: FractionalOffset.centerRight,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                'images/scan_qrcode.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              )),
          Container(
              margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                'images/setting.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ))
        ],
      ));
}

class MePageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MePageBodyState();
}

class _MePageBodyState extends State<MePageBody> {
  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).padding.top + 44;

    List widgets = MeListFactory.factoryList(MeListFactory.fetchData());
    widgets.insert(0, buildListHeader());
    widgets.add(buildListFooter());

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: SliverAppBarDelegate(minimum: top, maximum: top + 200),
          pinned: true,
          floating: false,
        ),
        SliverList(
          delegate: SliverChildListDelegate(widgets),
        )
      ],
    );
  }

  Widget buildListFooter() => Container(
        color: Colors.white,
        alignment: Alignment.center,
        height: 50,
        child: Text(
          '客服电话400-065-5799 工作时间9：30-18：30',
          style: TextStyle(fontSize: 10, color: ColorTable.lightGreyText),
        ),
      );

  Widget buildListHeader() => Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: ColorTable.normal, width: 0.5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('同步附件简历内容',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('将附件中的内容补充添加至在线简历，提升完善度',
                          style: TextStyle(
                              fontSize: 14, color: ColorTable.lightGreyText)),
                    )
                  ],
                ),
              ),
              Container(
                color: ColorTable.normal,
                height: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text('稍后处理',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorTable.greyText)),
                    ),
                    flex: 1,
                  ),
                  Container(
                    color: ColorTable.normal,
                    width: 0.5,
                    height: 50,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text('更新在线简历',
                          style: TextStyle(
                              fontSize: 16, color: ColorTable.primary)),
                    ),
                    flex: 1,
                  )
                ],
              )
            ],
          ),
        ),
      );
}

class MeListFactory {
  static List<MeCellItem> fetchData() => [
        MeCellItem(
            icon: Icons.insert_drive_file,
            title: '附件简历',
            placeholder: '已上传',
            type: MeCellItem.cell),
        MeCellItem(
            icon: Icons.add_circle_outline,
            title: '管理求职意向',
            placeholder: '离职-随时到岗',
            type: MeCellItem.cell),
        MeCellItem(type: MeCellItem.separator),
        MeCellItem(
            icon: Icons.get_app,
            title: 'Get',
            placeholder: '',
            type: MeCellItem.cell),
        MeCellItem(
            icon: Icons.home,
            title: '个人主页',
            placeholder: '',
            type: MeCellItem.cell),
        MeCellItem(
            icon: Icons.comment,
            title: '牛人问答',
            placeholder: '',
            type: MeCellItem.cell),
        MeCellItem(
            icon: Icons.favorite_border,
            title: '关注公司',
            placeholder: '',
            type: MeCellItem.cell),
        MeCellItem(type: MeCellItem.separator),
        MeCellItem(
            icon: Icons.bookmark_border,
            title: '提升简历曝光',
            placeholder: '',
            type: MeCellItem.cell),
        MeCellItem(type: MeCellItem.separator),
        MeCellItem(
            icon: Icons.help_outline,
            title: '帮助与反馈',
            placeholder: '',
            type: MeCellItem.cell),
        MeCellItem(
            icon: Icons.perm_identity,
            title: '我的客服',
            placeholder: '',
            type: MeCellItem.cell),
        MeCellItem(
            icon: Icons.tab,
            title: '关于',
            placeholder: '',
            type: MeCellItem.cell),
        MeCellItem(type: MeCellItem.separator)
      ];

  static List<Widget> factoryList(List<MeCellItem> data) =>
      List.generate(data.length, (index) {
        return MeCell(item: data[index]);
      });
}
