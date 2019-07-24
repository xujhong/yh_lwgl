import 'package:flutter/material.dart';
import 'package:yh_lwgl/activity/Inspection/Inspection_manger.dart';
import 'package:yh_lwgl/activity/personnel/personnel_manger.dart';
import 'package:yh_lwgl/activity/wordmanger/textManageDetailActivity.dart';
import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/model/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/home_banner.dart';
import 'package:yh_lwgl/widgets/section_title.dart';

class MainFragment extends StatefulWidget {
  @override
  _main_fragment createState() => _main_fragment();
}

class _main_fragment extends State<MainFragment> {
  final List<Menu> menus = [
    Menu(
        title: "文档管理",
        icon: "img_text_manager",
        channel: Constant.SECURITY_ONE),
    Menu(
        title: "人员管理",
        icon: "img_person_manager",
        channel: Constant.SECURITY_TWO),
    Menu(
        title: "日常巡检",
        icon: "img_special_check",
        channel: Constant.SECURITY_THREE),
    Menu(
        title: "隐患快报",
        icon: "img_danger_fast_repost",
        channel: Constant.SECURITY_FOUR),
    Menu(
        title: "隐患治理",
        icon: "img_danger_manage",
        channel: Constant.SECURITY_FIVE),
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
            Container(height: 1.0, color: Colors.grey[200]),
            GridMenuView(
              menus: menus,
              callback: (Menu menu) {
                if (menu.channel == Constant.SECURITY_ONE) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TextManageDetailActivity()));
                } else if (menu.channel == Constant.SECURITY_TWO) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PersonnelManger()));
                }else if(menu.channel==Constant.SECURITY_THREE){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InspectionManger()));
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
