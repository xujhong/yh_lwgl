import 'package:flutter/material.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';

///文件管理详情==》反馈结果

class WorkFeedBackItem extends StatelessWidget {
  //标题
  final String title;

  final String ctenrTitle;

  //内容
  final String content;

  //显示的位置
  final TextAlign textAlign;
  //最大显示多少行
  final int maxLines;

  //是否显示子级内容
  final bool isDisplay;

  WorkFeedBackItem({
    Key key,
    this.ctenrTitle,
    @required this.title,
    this.content = '',
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    @required this.isDisplay = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        child: Column(
      children: <Widget>[
        _item(context),
      ],
    ));
  }

  Widget _item(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15.0),
        padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
          minHeight: 50.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
          //画线
          bottom: Divider.createBorderSide(context,
              color: Colours.line, width: 0.6),
        )),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    title,
                    style: TextStyles.textDark14,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ctenrTitle,
                    style: TextStyles.textDark14,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    content,
                    textAlign: maxLines == 1 ? TextAlign.right : textAlign,
                    style: TextStyle(fontSize: 14.0,color: _call()),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ],
        ));
  }

  ///根据状态判断内容
  Color _call() {
    if (content == '未读') {
      return Colors.red[700];
    } else {
      return Colors.yellow[700];
    }
  }
}
