import 'package:flutter/material.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';

class ErrorView extends StatelessWidget {
  final OnClick onClick;

  const ErrorView({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      onTap: () {
        onClick();
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             loadAssetImage('ic_error'),
            SizedBox(
              height: 10,
            ),
            Text('加载失败，点击重试'),
          ],
        ),
      ),
    ));
  }
}

typedef OnClick = void Function();
