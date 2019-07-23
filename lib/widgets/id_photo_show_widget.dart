import 'package:flutter/material.dart';
import 'package:yh_lwgl/activity/wordmanger/textManageListActivity.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/image_utils.dart';
import 'package:yh_lwgl/widgets/picture_widget.dart';

///相片展示
class IDPhotoShowWidget extends StatelessWidget {
  List<String> urlPhoto;
  IDPhotoShowWidget(this.urlPhoto);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
      constraints: BoxConstraints(
        maxHeight: double.infinity,
        minHeight: 50.0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
        //画线
        bottom:
            Divider.createBorderSide(context, color: Colours.line, width: 0.6),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '身份证',
            style: TextStyles.textDark14,
          ),
          Gaps.vGap10,
          GridView.builder(
            itemCount:2,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context,index){
              return Container(
                height: 80.0,
                child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(new MaterialPageRoute<Null>(builder: (context) {
                        return new PictureWidget(picList: urlPhoto,index: index,);
                      }));
//                      Navigator.of(context).push(
//                        PictureWidget(urlPhoto,index),
//                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        loadNetworkImage(
                          urlPhoto[index],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(index==0?'身份证正面':'身份证反面', style: TextStyles.textNormal14),
                        )
                      ],
                    )),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //每行2个
              mainAxisSpacing: 10.0, //主轴方向间距
              crossAxisSpacing: 10.0, //水平方向间距
              childAspectRatio: 1.0, //纵轴缩放比例
            ),
          ),
        ],
      ),
    );
  }
}
