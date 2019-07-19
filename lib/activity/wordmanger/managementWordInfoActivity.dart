import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/glwjxfdatail_entity.dart';
import 'package:yh_lwgl/model/word_glwjxf_entity.dart';
import 'package:yh_lwgl/net/requestimpl.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/click_item.dart';
import 'package:yh_lwgl/widgets/error_view.dart';
import 'package:yh_lwgl/widgets/loading.dart';
import 'package:yh_lwgl/widgets/worditem/work_feedback_item.dart';

///管理文件详情
class ManagementWordInfoActivity extends StatefulWidget {
  const ManagementWordInfoActivity({Key key, @required this.wordGlwjxfData})
      : super(key: key);

  //不能为私有白变量
  final WordGlwjxfData wordGlwjxfData;

  @override
  _managementWordInfoState createState() => _managementWordInfoState();
}

class _managementWordInfoState extends State<ManagementWordInfoActivity> {
  //请求返回的对象
  AsyncSnapshot<GlwjxfdatailData> glwjxfdatailData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('详情'),
        ),
        body: FutureBuilder(
          future: RequestImpl.getquery_glwjxf_datail(widget.wordGlwjxfData.wjId),
          builder: (context, AsyncSnapshot<GlwjxfdatailData> snap) {
            if (snap.connectionState == ConnectionState.done) {
              if (snap.hasError) {
                return ErrorView(
                  onClick: () {
                    RequestImpl.getquery_glwjxf_datail(widget.wordGlwjxfData.wjId);
                  },
                );
              }
              //加载完成
              glwjxfdatailData = snap;
              return _bodyWidget();
            } else if (snap.connectionState == ConnectionState.waiting) {
              //加载中
              print('waiting');
              return Loading();
            }
          },
        ));
  }

  //body-Widget
  Widget _bodyWidget() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
              children: <Widget>[
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              _headWidget(),
          ClickItem(
            title: '接收单位',
            content: getorganName(),
          ),
          ClickItem(
          title: '是否需要反馈',
          content: glwjxfdatailData.data.glwj.isNeedFeedbackName,
        ),
        ClickItem(title: '下发文件'),
        Container(
          child: ListView.builder(
            // 如果滚动视图在滚动方向无界约束，那么shrinkWrap必须为true
            shrinkWrap: true,
            // 禁用ListView滑动，使用外层的ScrollView滑动
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.attach_file),
                title: Text(glwjxfdatailData.data.fjwjList[index].fjwjYwjm,style: TextStyles.textNormal14,),
                trailing: Icon(
                  Icons.cloud_download,
                ),
              );
            },
            itemCount: glwjxfdatailData.data.fjwjList.length,
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: Divider.createBorderSide(context,
                      color: Colours.line, width: 10.0))),
        ),
        ClickItem(
          title: '反馈结果',
//          content: glwjxfdatailData.data.glwj.feedbackResultName,
//          textStyle: TextStyle(color: setFeedbackStatu(glwjxfdatailData.data.glwj.feedbackResultName)),
        ),
        ListView.builder(
          // 如果滚动视图在滚动方向无界约束，那么shrinkWrap必须为true
          shrinkWrap: true,
          // 禁用ListView滑动，使用外层的ScrollView滑动
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return WorkFeedBackItem(
              title: glwjxfdatailData.data.glwjxq[index].organName??'11',
              ctenrTitle: glwjxfdatailData.data.glwjxq[index].modifiedTime??'',
              content: _backStr(index),
            );
          },
          itemCount: glwjxfdatailData.data.glwjxq.length,
        )
      ],
    )],
    )
    ,
    )
    ]
    ,
    );
  }

  ///头部widget
  Widget _headWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
//        color: Colours.color_0xFFFFFFFF,
      height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            glwjxfdatailData.data.glwj.wjName, //_glwjxfdatailData.glwj.wjName
            style: TextStyles.textDark14,
          ),
          Gaps.vGap16,
          Text(
            glwjxfdatailData.data.glwj.createdStaffName,
            //_glwjxfdatailData.glwj.createdStaffName
            style: TextStyles.textNormal12,
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: Divider.createBorderSide(context,
                  color: Colours.line, width: 10.0))),
    );
  }

  String getorganName() {
    String organName = '';
    for (int i = 0; i < glwjxfdatailData.data.glwjxq.length; i++) {
      if (i != 0) {
        organName += ',';
      }
      organName += glwjxfdatailData.data.glwjxq[i].organName;
    }

    return organName;
  }

//  Color setFeedbackStatu(String feedback) {
//
//    Color color;
//    switch (glwjxfdatailData.data.glwj.feedbackResultName) {
//      case "部分反馈":
//        color=Colors.yellow[700];
//        break;
//      case "全部反馈":
//        color=Colors.green[700];
//        break;
//      case "未反馈":
//        color=Colors.red[700];
//        break;
//
//      case "不需要反馈":
//        color=Colours.text_normal;
//        break;
//
//      case "已反馈":
//        color=Colors.green[700];
//        break;
//
//      default:
//        break;
//    }
//
//    return color;
//  }

  ///文件是否已经反馈
  String _backStr(int index){

    if(glwjxfdatailData.data.glwjxq[index].fjlist.length==0){
      return '未读';
    }else{
      return '已读';
    }
  }
}
