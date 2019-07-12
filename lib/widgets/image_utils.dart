import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yh_lwgl/utils/utils_widget.dart';

Widget loadAssetImage(String name, {double width, double height, BoxFit fit}) {
  return Image.asset(
    Utils.getImgPath(name),
    width: width,
    height: height,
    fit: fit,
  );
}

Widget loadNetworkImage(String imageUrl,
    {String placeholder: "none",
    double width,
    double height,
    BoxFit fit: BoxFit.cover}) {
  return CachedNetworkImage(
    imageUrl: imageUrl == null ? "" : imageUrl,
    placeholder: (context, url) =>
        loadAssetImage(placeholder, height: height, width: width, fit: fit),
    errorWidget: (context, url, error) =>
        loadAssetImage(placeholder, height: height, width: width, fit: fit),
    width: width,
    height: height,
    fit: fit,
  );
}
