import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:yh_lwgl/model/login_entity.dart';
import 'package:yh_lwgl/model/slry_entity.dart';
import 'package:yh_lwgl/model/word_entity.dart';
import 'package:yh_lwgl/net/dio_utils.dart';

class LoginPresenter {
  void login(String name, String pwd) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 接口请求例子
      /// get请求参数queryParameters  post请求参数params

      FormData formData = new FormData.from({
        "pwd": "yz",
        "name": "6v9m#123",
//        "clientType": "app",
//
//        "projId": "12",
//        "staffId": "1130",
//        "roleKind": "8",
      });

      Map<String, String> map = {
        "username": "yz",
        "password": "6v9m#123",
        "clientType": "app",
      };

      DioUtils.instance.requestNetwork<LoginData>(Method.put, "login",
          queryParameters: formData, onSuccess: (data) {
        print(data.createTime);
      }, onSuccessList: (data) {
        print(data[0].createTime);
      }, onError: (code, msg) {
        print("code$code");
        print("msg$msg");
      }, isList: true);
    });
  }

  //http://47.106.183.18:8080/mrxmgl/app/wdgl/ajax_query_wdxx_list
  void ajaxQueryWdxxList() {
    FormData formData = new FormData.from({
      "zdhbType": "1",
      "pageSize": "10",
      "pageNum": "0",
      "currentUserId": "2145",
    });

    DioUtils.instance.requestNetwork<WordData>(
        Method.put, "app/wdgl/ajax_query_wdxx_list",
        queryParameters: formData,
        onSuccessList: (data) {

        }, onError: (code, msg) {
      print("code$code");
      print("msg$msg");
    }, isList: true);
  }
}
