import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:areas/pages/position_page.dart';
import 'package:areas/pages/company_page.dart';
import 'styles.dart';
import 'package:areas/pages/message_page.dart';
import 'package:areas/pages/me_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: Colors.white,
            activeColor: ColorTable.primary,
            inactiveColor: ColorTable.normal,
            items: [
              BottomNavigationBarItem(
                  icon: NavigationBarItemIcon(imageNamed: 'position_normal'),
                  activeIcon: NavigationBarItemIcon(imageNamed: 'position_selected'),
                  title: Text('职位')),
              BottomNavigationBarItem(
                  icon: NavigationBarItemIcon(imageNamed: 'company_normal'),
                  activeIcon: NavigationBarItemIcon(imageNamed: 'company_selected'),
                  title: Text('公司')),
              BottomNavigationBarItem(
                  icon: NavigationBarItemIcon(imageNamed: 'message_normal'),
                  activeIcon: NavigationBarItemIcon(imageNamed: 'message_selected'),
                  title: Text('消息')),
              BottomNavigationBarItem(
                  icon: NavigationBarItemIcon(imageNamed: 'my_normal'),
                  activeIcon: NavigationBarItemIcon(imageNamed: 'my_selected'),
                  title: Text('我的'))
            ]),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return PositionPage();
                  break;
                case 1:
                  return CompanyPage();
                  break;
                case 2:
                  return MessagePage();
                  break;
                case 3:
                  return MePage();
                  break;
                default:
                  return null;
              }
            },
          );
        });
  }
}

class NavigationBarItemIcon extends StatelessWidget {
  NavigationBarItemIcon({Key key, @required this.imageNamed}) : super(key: key);
  
  final String imageNamed;

  @override
  Widget build(BuildContext context) {
    return Image.asset('images/${imageNamed}.png', width: 27, height: 27);
  }
}
