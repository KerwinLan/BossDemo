import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../cells/company_cell.dart';
import 'package:areas/styles.dart';
import 'package:areas/loader.dart';

class CompanyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: ColorTable.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: ColorTable.primary,
        leading: Align(
          alignment: FractionalOffset.centerLeft,
          child: Text('公司',
              style: TextStyle(
                  fontSize: TextSize.maximum,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 160,
            padding: EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
            color: Color(0x4CFFFFFF),
            child: Row(
              children: <Widget>[
                Image.asset('images/search.png', width: 20, height: 20),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    '搜索公司或职位',
                    style: TextStyle(
                        color: Colors.white, fontSize: TextSize.middle),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      child: CompanyPageBody(),
    );
  }
}

class CompanyPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CompanyPageBodyState();
}

class _CompanyPageBodyState extends State<CompanyPageBody> {
  List _companyList = [];

  @override
  Widget build(BuildContext context) {
    if (_companyList.length == 0) {
      Loader.loadList(
          code: Loader.company,
          completed: (result) {
            if (result != null && result.data != null) {
              setState(() {
                _companyList = result.data;
              });
            }
          });
    }

    return ListView.separated(
        itemBuilder: _itemBuilder,
        separatorBuilder: _separatorBuilder,
        itemCount: _companyList.length);
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return Divider(
      height: 8,
      color: Colors.transparent,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return CompanyCell(item: _companyList[index]);
  }
}
