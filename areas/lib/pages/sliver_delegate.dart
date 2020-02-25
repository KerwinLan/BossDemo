import 'package:flutter/material.dart';
import 'package:areas/styles.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({@required this.minimum, @required this.maximum});

  final double minimum;

  final double maximum;

  @override
  double get minExtent => minimum;

  @override
  double get maxExtent => maximum;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double percent = shrinkOffset / (maximum - minimum);
    if (percent > 1) percent = 1.0;

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: minimum, maxHeight: maximum),
        child: Container(
          color: ColorTable.primary,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(
                      left: 15, top: minimum + 15 - 54 * percent),
                  height: 34,
                  child: Text('Kerwin',
                      style: TextStyle(
                          fontSize: 30 - 10 * percent,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              Container(
                padding: EdgeInsets.only(top: 1 * (1.0 - percent)),
                child: opacityArea(1.0 - percent),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  Widget opacityArea(double opacity) => Opacity(
    opacity: opacity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: userArea()),
        Container(margin: EdgeInsets.only(top: 15), child: itemsArea())
      ],
    ),
  );

  Widget userArea() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text('建议更新在线简历', style: TextStyle(fontSize: 16, color: Colors.white)),
      ClipOval(child: Container(color: Colors.grey, width: 60, height: 60))
    ],
  );

  Widget itemsArea() => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Expanded(child: item('沟通过', '96'), flex: 1),
      Expanded(child: item('待面试', '10'), flex: 1),
      Expanded(child: item('已投简历', '16'), flex: 1),
      Expanded(child: item('收藏', '1'), flex: 1),
    ],
  );

  Widget item(String title, String value) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(value, style: TextStyle(fontSize: 18, color: Colors.white)),
      Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(title,
              style: TextStyle(fontSize: 12, color: Color(0x99FFFFFF))))
    ],
  );
}