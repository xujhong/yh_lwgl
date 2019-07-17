import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/word_entity.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/cardItem.dart';
class WordItem extends StatelessWidget {
  WordData _wordData;
  final VoidCallback onPressed;

  WordItem(this._wordData, {this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: CardItem(
          child: FlatButton(
        onPressed: onPressed,
        child: Container(
          height: 100.0,
          padding: const EdgeInsets.all(10.0),
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
                  Align(
                      alignment: FractionalOffset.topLeft,
                      child: Text(
                        _wordData.zdhbName,
                        style: TextStyles.textDark14,
                        textAlign: TextAlign.left,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_wordData.staffName, style: TextStyles.textGray12),
                      Text(_wordData.createdTime, style: TextStyles.textGray12),
                      Icon(
                        Icons.cloud_download,
                        color: Colours.color_blue,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
