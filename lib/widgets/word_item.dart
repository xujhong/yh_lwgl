import 'package:flutter/material.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';

import 'cardItem.dart';

class WordItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: CardItem(
        child: Container(
          height: 90.0,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              border: Border(
            bottom: Divider.createBorderSide(context,
                color: Colours.line, width: 0.8),
          )),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Align(alignment: FractionalOffset.topLeft,
                  child:Text("都香高速公路工地安全文明施工管理制度", style: TextStyles.textDark14,textAlign: TextAlign.left,) ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("A1承包商", style: TextStyles.textGray12),
                      Text("2019-02-25", style: TextStyles.textGray12),
                      Icon(Icons.cloud_download,color: Colours.color_blue,)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
