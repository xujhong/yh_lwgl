import 'package:rxdart/rxdart.dart';
import 'package:yh_lwgl/myhttp/Http.dart';
import 'package:yh_lwgl/model/login_model_entity.dart';
import 'package:yh_lwgl/myhttp/base_intercept.dart';

class RequestMap {
  static PublishSubject<LoginModelEntity> requestLogin<BaseResponse>(
      BaseIntercept baseIntercept) {
    String url = "login";
    LoginModelEntity loginResponseEntity =
    LoginModelEntity(); //模拟 带参数，直接对象转json就可以了

    Map<String,String> map={
      "username":"lzzy",
      "username":"1",
      "clientType":"android",
      "registrationType":"android",
      "registrationId":"190e35f7e00e833ef99",

    };

    loginResponseEntity.code ==1? false:true;
    return HttpManager().post(url,queryParameters:map,baseIntercept: baseIntercept,isCancelable: false);

//      HttpManager().get<LoginModelEntity>(url,
//          queryParameters: loginResponseEntity.toJson(),//
//          baseIntercept: baseIntercept,
//          isCancelable: false);
  }

  static PublishSubject testErrorrequest(BaseIntercept baseIntercept) {
    String urlError = "error";
    return HttpManager().get<LoginModelEntity>(urlError = "error",
        baseIntercept: baseIntercept);
  }
}
