import 'package:flutter/material.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/dimens.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';
import 'package:yh_lwgl/widgets/state_layout.dart';

class PersonnelMangerList extends StatefulWidget {
  const PersonnelMangerList({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  personnelMangerListState createState() => personnelMangerListState();
}

class personnelMangerListState extends State<PersonnelMangerList>
    with
        AutomaticKeepAliveClientMixin<PersonnelMangerList>,
        SingleTickerProviderStateMixin {
  List _list = [1,2,3];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _list.isEmpty
        ? StateLayout(
            type: StateType.goods,
          )
        : ListView.builder(
            itemCount: _list.length,
            itemBuilder: (_, index) {
              return Stack(
                children: <Widget>[

                  Positioned(
                    top: 10.0,
                      right: 10.0,
                      child: loadAssetImage("ic_save_file",width: 50.0,height: 50.0))
                  ,
                  Container(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child:  DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: Divider.createBorderSide(context, color: Colours.line, width: 0.8),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0, ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            loadNetworkImage("http://47.106.183.18:8080/gcjlpic/d_aqgl_rygl_slry/2019-03-01/3a0be39c-6aad-4203-875b-1c070767f96b.jpg", width: 72.0, height: 72.0),
                            Gaps.hGap8,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Gaps.vGap8,
                                  Text(
                                      "姓    名：刘杰",
                                      style: TextStyles.textDark12
                                  ),
                                  Gaps.vGap8,
                                  Text(
                                      "身份证号码：610201199898765363",
                                      style: TextStyles.textDark12
                                  ),
                                  Gaps.vGap8,
                                  Text(
                                      "进场日期：2019-03-01",
                                      style: TextStyles.textDark12
                                  ),
                                  Gaps.vGap8,
                                  Text(
                                      "人员类型：高级工程师",
                                      style: TextStyles.textDark12
                                  ),
                                  Gaps.vGap8,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            });
  }

  @override
  bool get wantKeepAlive => true;
}
