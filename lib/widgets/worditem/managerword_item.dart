import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/word_glwjxf_entity.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/cardItem.dart';

///管理文件item
class ManagerWordItem extends StatelessWidget {
  WordGlwjxfData _wordGlwjxfData;
  final VoidCallback onPressed;

  ManagerWordItem(this._wordGlwjxfData, {this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CardItem(
      child: FlatButton(
          onPressed: onPressed,
          child: ListTile(
            title: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                _wordGlwjxfData.wjName,
                softWrap: true, //自动换行
                overflow: TextOverflow.ellipsis, //截断处理
                maxLines: 2, //最大显示两行
                style: TextStyles.textDark14,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  _wordGlwjxfData.createdStaffName,
                  style: TextStyles.textDark12,
                ),
                Text(
                  _wordGlwjxfData.feedbackResultName,
                  style: TextStyles.textDark12,
                ),
              ],
            ),
          )),
    );
  }
}
