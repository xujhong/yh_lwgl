import 'package:flutter/material.dart';
import 'package:yh_lwgl/res/colors.dart';

class CardItem extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final Color color;
  final RoundedRectangleBorder shape;
  final double elevation;

  const CardItem(
      {Key key,
      this.margin,
      this.color,
      this.shape,
      this.elevation,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    EdgeInsets margin = this.margin;
    RoundedRectangleBorder shape = this.shape;
    Color color = this.color;
    margin ??=
        EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0);
    shape ??= new RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)));
    color ??= Colours.color_0xFFFFFFFF;

    return Card(elevation: elevation,shape: shape,color: color,margin: margin,child: child,);
  }
}
