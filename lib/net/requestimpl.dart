import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:yh_lwgl/common/common.dart';
import 'package:yh_lwgl/model/base_dto.dart';
import 'package:yh_lwgl/model/login_entity.dart';
import 'package:yh_lwgl/model/word_entity.dart';
import 'package:yh_lwgl/net/api.dart';
import 'package:yh_lwgl/net/interceptor.dart';
import 'package:yh_lwgl/net/request.dart';

///请求
class RequestImpl extends Request {
  Dio _dio;

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

  _handleRes(Response response) {
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

  //获取公众号列表
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
  Future<LoginData> login(String username, String password) async {
    Response response = await _dio.post(Api.login,
        data: FormData.from({'username': username, 'password': password}));
    return LoginData.fromJson(_handleRes(response));
  }



}
