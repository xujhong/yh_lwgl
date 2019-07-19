import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/model/base_dto.dart';
import 'package:yh_lwgl/model/glwjxfdatail_entity.dart';
import 'package:yh_lwgl/model/user_entity.dart';
import 'package:yh_lwgl/model/word_entity.dart';
import 'package:yh_lwgl/model/word_glwjxf_entity.dart';
import 'package:yh_lwgl/net/api.dart';
import 'package:yh_lwgl/net/interceptor.dart';
import 'package:yh_lwgl/net/request.dart';

///请求
class RequestImpl extends Request {
  static Dio _dio;

  RequestImpl() : super.internal() {
    Options options = Options(baseUrl: Api.baseUrl, connectTimeout: 10000);
    _dio = Dio(options);
    LogInterceptor interceptor = LogInterceptor();
    _dio.interceptor.request.onSend = interceptor.onSend;
    _dio.interceptor.response.onSuccess = interceptor.onSuccess;
    _dio.interceptor.response.onError = interceptor.onError;


//    _dio.onHttpClientCreate = (HttpClient client) {
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
//        return "PROXY 192.168.0.211";
//      };
//      // 你也可以自己创建一个新的HttpClient实例返回。
//      // return new HttpClient(SecurityContext);
//    };
    _setPersistCookieJar();
  }

  _setPersistCookieJar() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path;
    _dio.cookieJar = new PersistCookieJar(dir: path);
  }

  static _handleRes(Response response) {
    Map<String, dynamic> resJson;
    if (response.data is String) {
      resJson = json.decode(response.data);
    } else if (response.data is Map<String, dynamic>) {
      resJson = response.data;
    } else {
      throw DioError(message: '数据解析错误');
    }
    BaseDTO base = BaseDTO.fromJson(resJson);
    if (base.errorCode == 0) {
      return base.data;
    } else {
      throw DioError(message: base.errorMsg);
    }
  }

  //获取文档列表
  @override
  Future<List<WordData>> getSubscriptions(String zdhbType, int pageNum,String currentUserId) async {
    Response response = await _dio.post(Api.ajax_query_wdxx_list,
        data: FormData.from({'zdhbType': zdhbType, 'pageSize':Constant.PAGE_SIZE,'pageNum':pageNum,'currentUserId':currentUserId}));
    List<WordData> data = new List<WordData>();
    _handleRes(response).forEach((v) {
      data.add(new WordData.fromJson(v));
    });
    return data;
  }


  //登录
  @override
  Future<UserData> login(String username, String password) async {
    Response response = await _dio.post(Api.login,
        data: FormData.from({'username': username, 'password': password}));
    return UserData.fromJson(_handleRes(response));
  }


  ///获取管理文件列表
  @override
  Future<List<WordGlwjxfData>> getAjax_query_glwjxf_list(String currentUserId, int pageNum)async {

    Response response =await _dio.post(Api.ajax_query_glwjxf_list,data: FormData.from({'currentUserId':currentUserId,'pageNum':pageNum,'pageSize':Constant.PAGE_SIZE}));
    List<WordGlwjxfData> data=new List<WordGlwjxfData>();

    _handleRes(response).forEach((v) {
      data.add(new WordGlwjxfData.fromJson(v));
    });
    return data;
  }

  ///管理文件详情
  @override
  Future<GlwjxfdatailData> getAjax_query_glwjxf_datail(String wjId) async{
    // TODO: implement getAjax_query_glwjxf_datail
    
    Response response= await _dio.post(Api.ajax_query_glwjxf_datail,data: FormData.from({'wjId':wjId}));
    return GlwjxfdatailData.fromJson(_handleRes(response));
  }

  static Future<GlwjxfdatailData> getquery_glwjxf_datail(int wjId) async{
    // TODO: implement getAjax_query_glwjxf_datail

    Response response= await _dio.post(Api.ajax_query_glwjxf_datail,data: FormData.from({'wjId':wjId}));
    return GlwjxfdatailData.fromJson(_handleRes(response));
  }

}
