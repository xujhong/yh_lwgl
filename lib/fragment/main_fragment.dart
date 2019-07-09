import 'package:flutter/material.dart';
import 'package:yh_lwgl/activity/text_manage_List_activity.dart';
import 'package:yh_lwgl/model/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/home_banner.dart';
import 'package:yh_lwgl/widgets/section_title.dart';

class MainFragment extends StatefulWidget {
  @override
  _main_fragment createState() => _main_fragment();
}

class _main_fragment extends State<MainFragment> {

  final List<Menu> menus=[
    Menu(title: "文档管理", icon: "img_text_manager", channel: "movie"),
    Menu(title: "人员管理", icon: "img_person_manager", channel: "movie"),
    Menu(title: "日常巡检", icon: "img_special_check", channel: "movie"),
    Menu(title: "隐患快报", icon: "img_danger_fast_repost", channel: "movie"),
    Menu(title: "隐患治理", icon: "img_danger_manage", channel: "movie"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Scaffold(
      appBar: AppBar(
        title: Text("应用"),
        centerTitle: true,
        leading: Icon(Icons.email),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            HomeBanner(),
            SectionTitle(title: "安全管理"),
            Container(height: 1.0,
                color: Colors.grey[200]),
            GridMenuView(
              menus: menus,
              callback: (Menu menu) {
                print("点击了");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TextManageListActivity()));
              },
            )
          ],
        ),
      ),
    ));
  }
}
