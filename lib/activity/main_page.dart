import 'package:flutter/material.dart';
import 'package:yh_lwgl/fragment/contacts_fragment.dart';
import 'package:yh_lwgl/fragment/main_fragment.dart';
import 'package:yh_lwgl/fragment/mine_fragment.dart';
import 'package:yh_lwgl/fragment/notice_fragment.dart';

class MainPage extends StatefulWidget {

  @override
  _mainPage createState() => _mainPage();

}

class _mainPage extends State<MainPage> {

  int _currentIndex = 0;
  Color _defaultColor = Colors.grey;
  Color _activeColor = Colors.blue;

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          NoticeFragment(),
          MainFragment(),
          ContactsFragment(),
          MineFragment(),
        ],
        physics: NeverScrollableScrollPhysics(),

      ), bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon:Image.asset("assets/images/img_icon_notice_none.png",height: 20.0,width: 20.0,),
            activeIcon: Image.asset("assets/images/img_icon_notice.png",height: 20.0,width: 20.0,),
            title: Text(
              "消息",
              style: TextStyle(
                  color: _currentIndex != 0 ? _defaultColor : _activeColor
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon:Image.asset("assets/images/img_icon_home_none.png",height: 20.0,width: 20.0,),
            activeIcon: Image.asset("assets/images/img_icon_home.png",height: 20.0,width: 20.0,),
            title: Text(
              "应用",
              style: TextStyle(
                  color: _currentIndex != 1 ? _defaultColor : _activeColor
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon:Image.asset("assets/images/img_icon_contact_none.png",height: 20.0,width: 20.0,),
            activeIcon: Image.asset("assets/images/img_icon_contact.png",height: 20.0,width: 20.0,),
            title: Text(
              "联系人",
              style: TextStyle(
                  color: _currentIndex != 2 ? _defaultColor : _activeColor
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon:Image.asset("assets/images/img_icon_mine_none.png",height: 20.0,width: 20.0,),
            activeIcon: Image.asset("assets/images/img_icon_mine.png",height: 20.0,width: 20.0,),
            title: Text(
              "我的",
              style: TextStyle(
                  color: _currentIndex != 3 ? _defaultColor : _activeColor
              ),
            ),
          ),
        ]),
    );
  }
}