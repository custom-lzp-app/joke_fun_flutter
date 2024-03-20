import 'package:dio/dio.dart';
import 'package:druid_pamigo_flutter/common/util/log_util.dart';
import 'package:druid_pamigo_flutter/common/util/toast_util.dart';
import 'package:druid_pamigo_flutter/router/routers.dart';

class TokenExpireInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      // 登录过期
      LogE("Token Expire");
      showToast("当前登录信息已过期，请重新登录");
      AppRoutes.jumpPage(AppRoutes.loginPage);
    }
    super.onResponse(response, handler);
  }
}
