import 'package:dio/dio.dart';
import 'package:druid_pamigo_flutter/common/util/user_manager.dart';

class ParamsInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var headers = options.headers;
    String? token = UserManager.instance.loginEntity.value?.token;
    if (token != null) {
      if (token.isNotEmpty) {
        headers['token'] = token;
      }
    }
    headers['app'] = '1.0.0;1;13';
    headers['device'] = 'HUAWEI;CDY-AN00';
    super.onRequest(options, handler);
  }
}