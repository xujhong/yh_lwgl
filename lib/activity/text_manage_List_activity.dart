import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/section2_title.dart';

/**
 * 文档管理
 */
class TextManageListActivity extends StatefulWidget{
  @override
  _textManageListActivity createState()=>_textManageListActivity();
}

class _textManageListActivity extends State<TextManageListActivity>{

  //文档管理
  final List<Menu> wordMenus=[
    Menu(title: "制度汇编", icon: "img_text_manage_system", channel: "movie"),
    Menu(title: "知识库", icon: "img_text_manage_knowledge", channel: "movie"),
    Menu(title: "法制法规", icon: "img_text_manage_law", channel: "movie"),
    Menu(title: "综合查询", icon: "img_text_manage_search", channel: "movie"),
  ];

  //管理文件
  final List<Menu> wordManage=[
    Menu(title: "管理文件", icon: "img_text_manage_file", channel: "movie"),
  ];



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("文档管理"),
      ),
      body:ListView(
        children: <Widget>[
          SectionTwoTitle(title: "文档",titleColor: Colors.blue,),
          GridMenuView(
            menus: wordMenus,
            callback: (Menu){

            },
          ),
          SectionTwoTitle(title: "管理文件",titleColor: Colors.yellow[800],),
          GridMenuView(
            menus: wordManage,
              callback: (Menu){

              },
          )
        ],
      ),
    );
  }

}