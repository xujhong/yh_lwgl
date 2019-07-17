import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/glwjxfdatail_entity.dart';
import 'package:yh_lwgl/model/word_glwjxf_entity.dart';
import 'package:yh_lwgl/net/request.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/res/styles.dart';
import 'package:yh_lwgl/widgets/click_item.dart';
import 'package:yh_lwgl/widgets/loading.dart';
import 'package:yh_lwgl/widgets/toast.dart';
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
  GlwjxfdatailData _glwjxfdatailData;

//是否显示子级
  bool isSublevel = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _httpData();
  }


  //请求数据
  void _httpData(){

    Request().getAjax_query_glwjxf_datail('1144').then((data){
      setState(() {
        _glwjxfdatailData=data;
      });
    }).catchError((e){
      Toast.show(e.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('详情'),
        ),
        body: Stack(
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
                      ),
                      ClickItem(
                        title: 'A1标',
                      ),
                      ClickItem(
                        title: '是都需要反馈',
                        content: '否',
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
                              leading: Icon(Icons.ac_unit),
                              title: Text('安置包培训课件.pptx'),
                              trailing: Icon(
                                Icons.cloud_download,
                                color: Colors.blue,
                              ),
                            );
                          },
                          itemCount: 5,
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: Divider.createBorderSide(context,
                                    color: Colours.line, width: 10.0))),
                      ),
                      ClickItem(
                        title: '反馈结果',
                        content: '部分反馈',
                        textStyle: TextStyle(color: Colors.yellow[700]),
                      ),
                      ListView.builder(
                        // 如果滚动视图在滚动方向无界约束，那么shrinkWrap必须为true
                        shrinkWrap: true,
                        // 禁用ListView滑动，使用外层的ScrollView滑动
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return WorkFeedBackItem(
                            isDisplay: isSublevel,
                            title: 'A1标',
                            conteneTitle: 'A1承包商',
                            contentState: true,
                            contentData: '2019',
                            callback: () {
                              setState(() {
                                isSublevel = !isSublevel;
                              });
                            },
                          );
                        },
                        itemCount: 5,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
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
            _glwjxfdatailData.glwj.wjName, //_glwjxfdatailData.glwj.wjName
            style: TextStyles.textDark14,
          ),
          Gaps.vGap16,
          Text(
            _glwjxfdatailData.glwj.createdStaffName, //_glwjxfdatailData.glwj.createdStaffName
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
}
