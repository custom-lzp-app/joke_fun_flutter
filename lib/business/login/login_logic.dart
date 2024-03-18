import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:druid_pamigo_flutter/business/common/event/login_event.dart';
import 'package:druid_pamigo_flutter/common/util/event_bus_manager.dart';
import 'package:druid_pamigo_flutter/common/util/user_manager.dart';
import 'package:druid_pamigo_flutter/common/view_state/view_state_logic.dart';
import 'package:druid_pamigo_flutter/http/retrofit_client.dart';
import 'package:druid_pamigo_flutter/models/login_entity.dart';

import '../../../common/util/string_util.dart';

class LoginLogic extends ViewStateLogic {
  TextEditingController emailTextEditingController = TextEditingController();
  RxString email = "".obs;
  RxBool isEmailValid = false.obs;
  TextEditingController passwordTextEditingController = TextEditingController();
  RxString password = "".obs;
  RxBool isPasswordValid = false.obs;

  RxString verifyCode = "".obs;
  RxBool getVerifyCodeSuccess = false.obs;
  RxBool verifyCodeValid = false.obs;

  void updateEmail(String value) {
    email.value = value;
    isEmailValid.value = isPhoneNum(value);
    emailTextEditingController.value = TextEditingValue(
        text: value,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: value.length)));
  }

  void updatePassword(String value) {
    password.value = value;
    isPasswordValid.value = isPhoneNum(value);
    passwordTextEditingController.value = TextEditingValue(
        text: value,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: value.length)));
  }

  void inputVerifyCode(String verifyCode) {
    this.verifyCode.value = verifyCode;
    verifyCodeValid.value = verifyCode.length == 6;
  }

  /// 获取验证码
  void getVerifyCode() {
    sendRequest(
        RetrofitClient.instance.apiService.getLoginVerifyCode(email.value),
        showLoadingDialog: true,
        emptyAsSuccess: true,
        successCallback: (value) => getVerifyCodeSuccess.value = true);
  }

  /// 账号/密码 登录
  void loginByPassword() {
    sendRequest(
        RetrofitClient.instance.apiService.loginByCode(verifyCode.value, email.value),
        showLoadingDialog: true,
        successCallback: (value) {
          LoginEntity loginEntity = value!;
          UserManager.instance.updateLoginEntity(loginEntity);
          eventBus.fire(LoginEvent());
          Get.back();
        });
  }


  @override
  void onClose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.onClose();
  }
}
