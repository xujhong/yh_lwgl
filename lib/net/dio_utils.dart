
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yh_lwgl/utils/log_utils.dart';
import 'package:yh_lwgl/utils/toast.dart';
import '../entity_factory.dart';
import 'base_entity.dart';
import 'error_handle.dart';
import 'intercept.dart';

/// @weilu https://github.com/simplezhli
class DioUtils {
  static final DioUtils _singleton = DioUtils._internal();

  static DioUtils get instance => DioUtils();

  factory DioUtils() {
    return _singleton;
  }

  Dio getDio(){
    return dio;
  }

  Dio dio;

  DioUtils._internal() {
    var options = BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
      responseType: ResponseType.plain,
      contentType: ContentType.parse("application/x-www-form-urlencoded"),
      maxRedirects: 4,
      validateStatus: (status) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: "http://47.106.183.18:8080/xmgsxm/",
//      contentType: ContentType('application', 'x-www-form-urlencoded', charset: 'utf-8'),
    );
    dio = Dio(options);

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        // config the http client
        client.findProxy = (uri) {
          //proxy all request to localhost:8888
          return "PROXY 192.168.0.211:8888";
        };
        // you can also create a new HttpClient to dio
        // return new HttpClient();
      };

    /// 统一添加身份验证请求头
    dio.interceptors.add(AuthInterceptor());
    /// 刷新Token
    dio.interceptors.add(TokenInterceptor());
    /// 打印Log
    dio.interceptors.add(LoggingInterceptor());
  }

  // 数据返回格式统一，统一处理异常
  Future<BaseEntity<T>> _request<T>(String method, String url, {Map<String, dynamic> data, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options}) async {
    var response = await dio.request(url, data: data, queryParameters: queryParameters, options: _checkOptions(method, options), cancelToken: cancelToken);

    int _code;
    String _msg;
    T _data;

    try {
      Map<String, dynamic> _map = json.decode(response.data.toString());
      _code = _map["code"];
      _msg = _map["msg"];
      print(_map.toString());
      if (_map.containsKey("data")){
        _data = EntityFactory.generateOBJ(_map["data"]);
        print(_map["data"]);
      }
    }catch(e){
      print(e);
      return parseError();
    }
    return BaseEntity(_code, _msg, _data);
  }

  Future<BaseEntity<List<T>>> _requestList<T>(String method, String url, {Map<String, dynamic> data, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options}) async {
    var response = await dio.request(url, data: data, queryParameters: queryParameters, options: _checkOptions(method, options), cancelToken: cancelToken);
    int _code;
    String _msg;
    List<T> _data = [];

    try {
      Map<String, dynamic> _map = json.decode(response.data.toString());
      _code = _map["code"];
      _msg = _map["msg"];
      if (_map.containsKey("data")){
        ///  List类型处理，暂不考虑Map
        (_map["data"] as List).forEach((item){
          _data.add(EntityFactory.generateOBJ<T>(item));
          print(_map["data"]);
        });
      }
    }catch(e){
      print(e);
      return parseError();
    }
    return BaseEntity(_code, _msg, _data);
  }

  BaseEntity parseError(){
    return BaseEntity(ExceptionHandle.parse_error, "数据解析错误", null);
  }

  Options _checkOptions(method, options) {
    if (options == null) {
      options = new Options();
    }
    options.method = method;
    return options;
  }

  Future<BaseEntity<T>> request<T>(String method, String url, {Map<String, dynamic> params, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options}) async {
    var response = await _request<T>(method, url, data: params, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
    return response;
  }

  Future<BaseEntity<List<T>>> requestList<T>(String method, String url, {Map<String, dynamic> params, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options}) async {
    var response = await _requestList<T>(method, url, data: params, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
    return response;
  }

  /// 统一处理(onSuccess返回T对象，onSuccessList返回List<T>)
  requestNetwork<T>(Method method, String url, {Function(T t) onSuccess, Function(List<T> list) onSuccessList, Function(int code, String mag) onError,
    Map<String, dynamic> params, Map<String, dynamic> queryParameters, CancelToken cancelToken, Options options, bool isList : false}){
    String m;
    switch(method){
      case Method.get:
        m = "GET";
        break;
      case Method.post:
        m = "POST";
        break;
      case Method.put:
        m = "PUT";
        break;
      case Method.patch:
        m = "PATCH";
        break;
      case Method.delete:
        m = "DELETE";
        break;
    }
    Observable.fromFuture(isList ? requestList<T>(m, url, params: params, queryParameters: queryParameters, options: options, cancelToken: cancelToken) :
    request<T>(m, url, params: params, queryParameters: queryParameters, options: options, cancelToken: cancelToken))
        .asBroadcastStream()
        .listen((result){
      if (result.code == 0){
        isList ? onSuccessList(result.data) : onSuccess(result.data);
      }else{
        onError == null ? _onError(result.code, result.msg) : onError(result.code, result.msg);
      }
    }, onError: (e){
      if (CancelToken.isCancel(e)){
        Log.i("取消请求接口： $url");
      }
      Error error = ExceptionHandle.handleException(e);
      onError == null ? _onError(error.code, error.msg) : onError(error.code, error.msg);
    });
  }

  _onError(int code, String mag){
    Log.e("接口请求异常： code: $code, mag: $mag");
    Toast.show(mag);
  }
}
enum Method {
  get,
  post,
  put,
  patch,
  delete,
}
