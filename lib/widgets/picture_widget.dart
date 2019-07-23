import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yh_lwgl/res/colors.dart';

///图片预览
class PictureWidget extends StatefulWidget {
  final List<String> picList;
  final int index;

  const PictureWidget({
    Key key,
    @required this.picList,
    this.index,
  }) : super(key: key);

  @override
  _pictureWidgetState createState() => _pictureWidgetState();
}

class _pictureWidgetState extends State<PictureWidget> {
  int startX = 0;
  int endX = 0;
  int index = 0;
  int lenth = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index;
    lenth = widget.picList.length;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: widget.picList[index],
                  fit: BoxFit.cover,
                ),
              ),
              onHorizontalDragDown: (detail) {
                startX = detail.globalPosition.dx.toInt();
              },
              onHorizontalDragUpdate: (detail) {
                endX = detail.globalPosition.dx.toInt();
              },
              onHorizontalDragEnd: (detail) {
                _getIndex(endX - startX);
                setState(() {});
              },
              onHorizontalDragCancel: () {},
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Text(
                  '${index + 1}/${lenth}',
                  style: TextStyle(color: Colours.text_normal,fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }

  void _getIndex(int delta) {
    if (delta > 50) {
      setState(() {
        index--;
        index = index.clamp(0, widget.picList.length - 1);
      });
    } else if (delta < 50) {
      setState(() {
        index++;
        index = index.clamp(0, widget.picList.length - 1);
      });
    }
  }
}
