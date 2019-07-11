import 'package:flutter/material.dart';
import 'package:yh_lwgl/activity/wordmanger/textManageListActivity.dart';
import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/model/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/section2_title.dart';

/**
 * 文档管理
 */
class TextManageDetailActivity extends StatefulWidget {
  @override
  _textManageListActivity createState() => _textManageListActivity();
}

class _textManageListActivity extends State<TextManageDetailActivity> {
  //文档管理
  final List<Menu> wordMenus = [
    Menu(
        title: "制度汇编",
        icon: "img_text_manage_system",
        channel: Constant.WORD_ONE),
    Menu(
        title: "知识库",
        icon: "img_text_manage_knowledge",
        channel: Constant.WORD_TWO),
    Menu(
        title: "法制法规",
        icon: "img_text_manage_law",
        channel: Constant.WORD_THREE),
    Menu(
        title: "综合查询",
        icon: "img_text_manage_search",
        channel: Constant.WORD_FOUR),
  ];

  //管理文件
  final List<Menu> wordManage = [
    Menu(
        title: "管理文件",
        icon: "img_text_manage_file",
        channel: Constant.WORD_MANGER_ONE),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("文档管理"),
      ),
      body: ListView(
        children: <Widget>[
          SectionTwoTitle(
            title: "文档",
            titleColor: Colors.blue,
          ),
          GridMenuView(
            menus: wordMenus,
            callback: (Menu menu) {
              if (menu.channel == Constant.WORD_ONE) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TextManageListActivity()));
              } else if (menu.channel == Constant.WORD_TWO) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TextManageListActivity()));
              } else if (menu.channel == Constant.WORD_THREE) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TextManageListActivity()));
              } else if (menu.channel == Constant.WORD_FOUR) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TextManageListActivity()));
              }
            },
          ),
          SectionTwoTitle(
            title: "管理文件",
            titleColor: Colors.yellow[800],
          ),
          GridMenuView(
            menus: wordManage,
            callback: (Menu) {},
          )
        ],
      ),
    );
  }
}
