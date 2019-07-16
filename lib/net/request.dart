import 'package:yh_lwgl/model/login_entity.dart';
import 'package:yh_lwgl/model/word_entity.dart';
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


  //登录
  Future<LoginData> login(String username, String password);
}
