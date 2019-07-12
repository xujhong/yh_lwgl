import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:yh_lwgl/model/login_entity.dart';
import 'package:yh_lwgl/model/slry_entity.dart';
import 'package:yh_lwgl/model/word_entity.dart';
import 'package:yh_lwgl/net/dio_utils.dart';

class PostPresenter {
  void login(String name, String pwd) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 接口请求例子
      /// get请求参数queryParameters  post请求参数params

      Map<String, String> map = {
        "username": "xmgs",
        "password": "1",
        "clientType": "android",
        "registrationType": "android",
        "registrationId": "190e35f7e00e833ef99",
      };

      DioUtils.instance.requestNetwork<LoginData>(Method.put, "login",
          params: map, onSuccess: (data) {
        print(data.staffName);
      }, onSuccessList: (data) {
        print(data[0].staffName);
      }, onError: (code, msg) {
        print("code$code");
        print("msg$msg");
      }, isList: true);
    });
  }

  ///获取制度汇编列表数据
  static ajaxQueryWdxxList({pageNum = 1,bool needDb = false}) async{
    FormData formData = new FormData.from({
      "zdhbType": "1",
      "pageSize": "10",
      "pageNum": "$pageNum",
      "currentUserId": "2145",
    });

    DioUtils.instance.requestNetwork<WordData>(
        Method.put, "app/wdgl/ajax_query_wdxx_list",
        queryParameters: formData,
        onSuccessList: (data) {
          return data;
        }, onError: (code, msg) {
      print("code$code");
      print("msg$msg");
    }, isList: true);
  }
}
