
import 'package:fluro/fluro.dart';
import 'package:yh_lwgl/routers/router_init.dart';

import 'login_page.dart';



class LoginRouter implements IRouterProvider{

  static String loginPage = "/login";

  @override
  void initRouter(Router router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, params) => IoginPage()));
  }
  
}