import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/grid_menu_view.dart';
import 'package:yh_lwgl/widgets/grid_menu_item.dart';

class GridMenuView extends StatelessWidget{

  final Function callback;
  final List<Menu> menus;

  GridMenuView({Key key,this.callback,this.menus}) : super(key :key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          GridView.builder(
            itemCount: menus.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            itemBuilder: (context,index){
              final border=BorderSide(color: Colors.grey[200]);

              return Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
//                          top: border,
//                          start: border,
                          end: (index % 4) == 3 ? border : BorderSide.none)),
                  child: GridMenuItem(
                    menu: menus[index],
                    callback: callback,
                  ));
            },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
             ),
          Container(
            height:1.0,
            color: Colors.grey[200],
          )
        ],
      ),
    );
  }
}