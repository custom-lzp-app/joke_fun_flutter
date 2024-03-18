import 'package:druid_pamigo_flutter/common/ext/asset_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/cpn/app_bar.dart';
import '../../common/cpn/cpn_verify_code_input.dart';
import '../../common/cpn/cpn_view_state.dart';
import '../../common/util/keyboard_util.dart';
import '../../theme/color_palettes.dart';
import 'login_logic.dart';

class LoginPage extends CpnViewState<LoginLogic> {
  const LoginPage({Key? key}) : super(key: key, bindViewState: false);

  @override
  AppBar? buildAppBar() => commonAppBar(bottom: commonTitleBar());

  @override
  Widget buildBody(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 64.w),
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: !logic.getVerifyCodeSuccess.value
              ? _inputPhoneNum()
              : _inputVerifyCode()),
    );
  }

  Widget _inputPhoneNum() {
    return Column(
      key: const ValueKey("_inputPhoneNum"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.w),
        Row(
          children: [
            Image.asset("ic_pamigo_pet".webp,
                width: 160.w,
                height: 160.w),
            SizedBox(width: 20.w),
            Text("Pamigo",
              style: TextStyle(
                  color: const Color(0xFF0F1010), fontSize: 48.w,fontWeight:FontWeight.w600 ))
          ],
        ),
        SizedBox(height: 80.w),
        _emailTextField(),
        SizedBox(height: 30.w),
        _passwordTextField(),
        SizedBox(height: 48.w),
        _signInButton()
      ],
    );
  }

  Widget _emailTextField() {
    return Container(
      height: 112.w,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 30.w, right: 24.w),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            color: const Color(0x1C000000),
            width: 2.w,
          )),
      child: Row(
        children: [
          Image.asset("ic_login_user".webp, width: 45.w, height: 45.w),
          SizedBox(width: 16.w),
          Expanded(
            child: TextField(
              controller: logic.emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              style: TextStyle(
                  fontSize: 40.w,
                  color: ColorPalettes.instance.firstText,
                  letterSpacing: 1.1),
              maxLines: 1,
              cursorColor: ColorPalettes.instance.primary,
              decoration: InputDecoration(
                hintText: "Email",
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontSize: 36.w, color: const Color(0xFF333738)),
              ),
              onChanged: (value) {
                logic.updateEmail(value);
              },
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: (logic.email.value.isNotEmpty)
                  ? Image.asset(
                "ic_clear_input".webp,
                width: 40.w,
                height: 40.w,
                color: ColorPalettes.instance.thirdIcon,
              )
                  : SizedBox(width: 40.w),
            ),
            onTap: () {
              logic.updateEmail("");
            },
          )
        ],
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      height: 112.w,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 30.w, right: 24.w),
      decoration: BoxDecoration(
        color:Colors.transparent,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: const Color(0x1C000000),
          width: 2.w,
        )),
      child: Row(
        children: [
          Image.asset("ic_login_pwd".webp, width: 45.w, height: 45.w),
          SizedBox(width: 16.w),
          Expanded(
            child: TextField(
              controller: logic.passwordTextEditingController,
              keyboardType: TextInputType.visiblePassword,
              autofocus: true,
              style: TextStyle(
                  fontSize: 40.w,
                  color: ColorPalettes.instance.firstText,
                  letterSpacing: 1.1),
              maxLines: 1,
              cursorColor: ColorPalettes.instance.primary,
              decoration: InputDecoration(
                hintText: "Password",
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontSize: 36.w, color: const Color(0xFF333738)),
              ),
              onChanged: (value) {
                logic.updatePassword(value);
              },
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: (logic.password.value.isNotEmpty)
                  ? Image.asset(
                "ic_clear_input".webp,
                width: 40.w,
                height: 40.w,
                color: ColorPalettes.instance.thirdIcon,
              )
                  : SizedBox(width: 40.w),
            ),
            onTap: () {
              logic.updatePassword("");
            },
          )
        ],
      ),
    );
  }

  Widget _signInButton() {
    return Container(
      width: double.infinity,
      height: 112.w,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 48.w, right: 48.w),
      decoration: BoxDecoration(
          color: logic.isEmailValid.value
              ? ColorPalettes.instance.primary
              : ColorPalettes.instance.secondary,
          borderRadius: BorderRadius.circular(56.w)),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Text("Sign In",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.w,
                  fontWeight: FontWeight.w600)),
        ),
        onTap: () {
          if (logic.isEmailValid.value&&logic.isPasswordValid.value) {
            hideKeyboard();
            logic.loginByPassword();
          }
        },
      ),
    );
  }

  Widget _inputVerifyCode() {
    return Column(
      key: const ValueKey("_inputVerifyCode"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 64.w),
        Text("请输入验证码1",
            style: TextStyle(
                color: ColorPalettes.instance.firstText,
                fontSize: 48.w,
                fontWeight: FontWeight.w600)),
        SizedBox(height: 24.w),
        Text("请关注微信公众号【Cretin的开发之路】，在输入框输入【#13】获取验证码。",
            style: TextStyle(
                color: ColorPalettes.instance.thirdText, fontSize: 24.w)),
        SizedBox(height: 80.w),
        CpnVerifyCodeInput(
          height: 88.w,
          onSubmit: (value) {
            logic.inputVerifyCode(value);
          },
        ),
        SizedBox(height: 48.w),
        _loginButton(),
        SizedBox(height: 32.w),
      ],
    );
  }

  Widget refreshVerifyCodeButton() {
    return Container(
        height: 40.w,
        width: 140.w,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        decoration: BoxDecoration(
            color: ColorPalettes.instance.inputBackground,
            borderRadius: BorderRadius.circular(20.w)),
        child: Text("重新获取1",
            style: TextStyle(
                color: ColorPalettes.instance.secondText, fontSize: 24.w)));
  }

  Widget _loginButton() {
    return Container(
      width: double.infinity,
      height: 112.w,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 48.w, right: 24.w),
      decoration: BoxDecoration(
          color: logic.verifyCodeValid.value
              ? ColorPalettes.instance.primary
              : ColorPalettes.instance.secondary,
          borderRadius: BorderRadius.circular(56.w)),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Text("登录1",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.w,
                  fontWeight: FontWeight.w600)),
        ),
        onTap: () {
          logic.loginByPassword();
        },
      ),
    );
  }
}