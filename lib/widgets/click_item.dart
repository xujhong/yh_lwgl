import 'package:flutter/material.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';

class ClickItem extends StatelessWidget {
  //标题
  final String title;

  //内容
  final String content;

  //显示的位置
  final TextAlign textAlign;

  //字体样式
  final TextStyle textStyle;

  //最大显示多少行
  final int maxLines;

  //点击回调
  final GestureTapCallback callback;

  ClickItem(
      {Key key,
      this.callback,
      @required this.title,
      this.content = '',
      this.textAlign = TextAlign.start,
      this.textStyle = TextStyles.textGray14,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: callback,
      child: Container(
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
        )
        ),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyles.textDark14,

            ),
            Spacer(),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Text(
                    content,
                    textAlign: maxLines == 1 ? TextAlign.right : textAlign,
                    style: textStyle ?? TextStyles.textDark14,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            Opacity(
              opacity: callback == null ? 0 : 1,
              child: Padding(
                padding: EdgeInsets.only(top: maxLines == 1 ? 0.0 : 2.0),
                child: loadAssetImage('ic_arrow_right',width: 16.0,height: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
