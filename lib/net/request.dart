import 'package:yh_lwgl/model/glwjxfdatail_entity.dart';
import 'package:yh_lwgl/model/hidden/fxyh_list_entity.dart';
import 'package:yh_lwgl/model/slry_detail_entity.dart';
import 'package:yh_lwgl/model/slry_entity.dart';
import 'package:yh_lwgl/model/tzzyry_details_entity.dart';
import 'package:yh_lwgl/model/tzzyry_entity.dart';
import 'package:yh_lwgl/model/user_entity.dart';
import 'package:yh_lwgl/model/word_entity.dart';
import 'package:yh_lwgl/model/word_glwjxf_entity.dart';
import 'package:yh_lwgl/model/xjru/xjrw_count_entity.dart';
import 'package:yh_lwgl/model/xjru/xjrw_list_entity.dart';
import 'package:yh_lwgl/model/xjru/xjrw_yjczrw_detail_entity.dart';
import 'package:yh_lwgl/net/requestimpl.dart';


abstract class Request {
  static RequestImpl _impl;

  Request.internal();

  factory Request() {
    if (_impl == null) {
      _impl = RequestImpl();
    }
    return _impl;
  }


  //获取汇编制度列表数据
  Future<List<WordData>> getSubscriptions(String zdhbType, int pageNum,String currentUserId);

  //获取管理文件列表数据
  Future<List<WordGlwjxfData>> getAjax_query_glwjxf_list(String currentUserId,int pageNum);

  //管理文件详情
  Future<GlwjxfdatailData> getAjax_query_glwjxf_datail(String wjId);

  //登录
  Future<UserData> login(String username, String password);

  //人员管理列表
  Future<List<SlryData>> getAjax_slry_list(String organId,String currentUserId);

  //特种作业人员
  Future<List<TzzyryData>> getAjax_tzzyry_list(String organId,String currentUserId);

  //巡检任务分类
  Future<List<XjrwCountData>> getAjax_zrw_count(int staffId, int organId);

  //巡检任务列表
  Future<List<XjrwListData>> getAjax_xjrw_zrw_list(int operFlag, int pageNum,int staffId,int organId);

  //巡检记录list
  Future<List<XjrwYjczrwDetailData>> getAjax_xjrw_yjczrw_detail(int zrwId,int pageNum);

  //发现隐患提交记录
  Future<List<FxyhListData>> getAjax_query_fxyh_list(int currentUserId);

}
