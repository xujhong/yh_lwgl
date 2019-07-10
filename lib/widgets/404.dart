import 'package:flutter/material.dart';
import 'package:yh_lwgl/widgets/app_bar.dart';
import 'package:yh_lwgl/widgets/state_layout.dart';

class WidgetNotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "页面不存在",
      ),
      body: StateLayout(
        type: StateType.account,
        hintText: "页面不存在",
      ),
    );
  }
}
