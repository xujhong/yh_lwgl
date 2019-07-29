import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/tzzyry_details_entity.dart';
import 'package:yh_lwgl/model/tzzyry_entity.dart';
import 'package:yh_lwgl/net/requestimpl.dart';
import 'package:yh_lwgl/res/colors.dart';
import 'package:yh_lwgl/widgets/click_item.dart';
import 'package:yh_lwgl/widgets/content_text_widget.dart';
import 'package:yh_lwgl/widgets/error_view.dart';
import 'package:yh_lwgl/widgets/id_photo_show_widget.dart';
import 'package:yh_lwgl/widgets/loading.dart';
import 'package:yh_lwgl/widgets/photo_grived_shou.dart';

//特种作业人员详情
class PersonnelMangerTzzyDetails extends StatefulWidget{

  TzzyryData tzzyryData;

  PersonnelMangerTzzyDetails(this.tzzyryData);

  @override
  _personnelMangerTzzyDetailsState createState()=>_personnelMangerTzzyDetailsState();
}

class _personnelMangerTzzyDetailsState extends State<PersonnelMangerTzzyDetails>{

  //请求返回的对象
  AsyncSnapshot<TzzyryDetailsData> _slryDetailData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('详情'),),
      body: FutureBuilder(
        future: RequestImpl.getAjax_tzzyry_detail(widget.tzzyryData.tzzyId),
        builder: (context, AsyncSnapshot<TzzyryDetailsData> snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasError) {
              return ErrorView(
                onClick: () {
                  RequestImpl.getAjax_slry_detail(widget.tzzyryData.tzzyId);
                },
              );
            }
            //加载完成
            _slryDetailData = snap;
            return _bodyBuild();
          } else if (snap.connectionState == ConnectionState.waiting) {
            //加载中
            print('waiting');
            return Loading();
          }
        },
      ),
    );
  }


  Widget _bodyBuild() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ClickItem(
                  title: '标段',
                  content: '${_slryDetailData.data.organName}',
                ),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colours.line,
                ),
                PhotoGrivedShow(urlPhoto: _photoIcon(),title: '头像',),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colours.line,
                ),
                IDPhotoShowWidget(_IDphoto(_slryDetailData.data.sfzList)),
                ClickItem(
                  title: '姓名',
                  content: _slryDetailData.data.tzzyXm,
                ),
                ClickItem(
                  title: '性别',
                  content: _slryDetailData.data.tzzyXb==0?'女':'男',
                ),
                ClickItem(
                  title: '年龄',
                  content: _slryDetailData.data.tzzyNl,
                ),
                ClickItem(
                  title: '身份证号',
                  content: _slryDetailData.data.tzzySfzh,
                ),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colours.line,
                ),
                ClickItem(
                  title: '工种',
                  content: _slryDetailData.data.tzzyGz,
                ),
                ClickItem(
                  title: '进场日期',
                  content: _slryDetailData.data.tzzyJcrq,
                ),
                ClickItem(
                  title: '工作班组',
                  content: _slryDetailData.data.tzzyGzbz,
                ),
                ClickItem(
                  title: '工作地点',
                  content: _slryDetailData.data.tzzyGzdd,
                ),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colours.line,
                ),
                ClickItem(
                  title: '证书编号',
                  content: _slryDetailData.data.tzzyAqzs,
                ),
                ClickItem(
                  title: '发证部门',
                  content: _slryDetailData.data.tzzyFzbm,
                ),
                ClickItem(
                  title: '发证日期',
                  content: _slryDetailData.data.tzzyFsrq,
                ),
                ClickItem(
                  title: '复审日期',
                  content: _slryDetailData.data.tzzyFzrq,
                ),
                PhotoGrivedShow(urlPhoto: _zsListIcon(_slryDetailData.data.zsList),title: '证书',),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colours.line,
                ),
                ContentTextWidget(title:'备注',count: _slryDetailData.data.tzzyBz),
              ],
            ))
      ],
    );
  }

  //头像
  List<String> _photoIcon(){
    List<String> photo = new List();
    photo.add(_slryDetailData.data.txFjwjFwdz);
    return photo;
  }


  //身份证照片
  List<String> _IDphoto(List<TzzyryDetailsDataSfzlist> sfzList) {
    List<String> photo = new List();

    for (int i = 0; i < sfzList.length; i++) {
      photo.add(sfzList[i].fjwjFwdz ?? '');
    }

    return photo;
  }

  //证书
  List<String> _zsListIcon(List<TzzyryDetailsDataZslist> zslist){
    List<String> photo = new List();

    for (int i = 0; i < zslist.length; i++) {
      photo.add(zslist[i].fjwjFwdz ?? '');
    }

    return photo;
  }

}