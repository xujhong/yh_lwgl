import 'package:flutter/material.dart';
import 'package:yh_lwgl/activity/hiddendanger/hiddenfindrecord_list.dart';
import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/model/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/section2_title.dart';

//隐患快报管理
class HiddendangerManger extends StatefulWidget {
  @override
  _hiddendangerManger createState() => _hiddendangerManger();
}

class _hiddendangerManger extends State<HiddendangerManger> {

  List<Menu> findHiddenMenus = [
    Menu(
        title: "提交隐患",
        icon: "img_find_danger",
        channel: Constant.HIDDEN_TIJIAO),
    Menu(
        title: "提交记录",
        icon: "img_find_danger_list",
        channel: Constant.HIDDEN_JILU),
  ];

  List<Menu> putHiddenMenus = [
    Menu(
        title: "提报隐患",
        icon: "img_fast_repost",
        channel: Constant.HIDDEN_TIBAO),
    Menu(
        title: "提报处置",
        icon: "img_repost_handle",
        channel: Constant.HIDDEN_TIBAO_CHUZHI),
    Menu(
        title: "提报记录",
        icon: "img_repost_list",
        channel: Constant.HIDDEN_TIBAO_JILU),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('隐患快报'),
      ),
      body: ListView(
        children: <Widget>[
          SectionTwoTitle(
            title: '发现隐患',
            titleColor: Colors.blue,
          ),
          GridMenuView(
            menus: findHiddenMenus,
            callback: (Menu menu) {
              if (menu.channel == Constant.HIDDEN_TIJIAO) {

              } else if (menu.channel == Constant.HIDDEN_JILU) {
                Navigator.of(context).push(new MaterialPageRoute<Null>(builder: (context) {
                  return new HiddenFindRecordList();
                }));
              }
            },
          ),
          SectionTwoTitle(
            title: '隐患提报',
            titleColor: Colors.orange[500],
          ),
          GridMenuView(
            menus: putHiddenMenus,
            callback: (Menu menu) {
              if (menu.channel == Constant.HIDDEN_TIBAO) {
              } else if (menu.channel == Constant.HIDDEN_TIBAO_CHUZHI) {
              } else if (menu.channel == Constant.HIDDEN_TIBAO_JILU) {}
            },
          ),
        ],
      ),
    );
  }
}
