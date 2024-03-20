import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:druid_pamigo_flutter/common/cpn/app_bar.dart';
import 'package:druid_pamigo_flutter/common/cpn/cpn_image.dart';
import 'package:druid_pamigo_flutter/common/cpn/cpn_view_state.dart';
import 'package:druid_pamigo_flutter/common/ext/asset_ext.dart';
import 'package:druid_pamigo_flutter/common/util/media_util.dart';
import 'package:druid_pamigo_flutter/common/util/toast_util.dart';
import 'package:druid_pamigo_flutter/common/util/user_manager.dart';
import 'package:druid_pamigo_flutter/models/user_info_entity.dart';
import 'package:druid_pamigo_flutter/router/routers.dart';
import 'package:druid_pamigo_flutter/theme/color_palettes.dart';

import '../my/my_logic.dart';

/// 首页-我的
class MinePage extends CpnViewState<MyLogic> {
  const MinePage({Key? key}) : super(key: key, bindViewState: false);

  @override
  AppBar? buildAppBar() => commonAppBar(backgroundColor: ColorPalettes.instance.primary);

  @override
  Widget buildBody(context) {
    return Container(
        color: const Color(0xffF8F7F6), // 设置背景颜色
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Column(
              children: [
                _userBasicInfo(),
                _userMenuInfo()
              ],
            ),
          ),
        )
    );
  }

  Widget _userBasicInfo() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        AppRoutes.jumpPage(AppRoutes.userCenterPage, needLogin: true);
      },
      child: Container(
          // padding: EdgeInsets.only(top: 64.w, bottom: 48.w),
          padding: EdgeInsets.only(left:  32.w,right: 32.w,top: 60.w, bottom: 48.w),
          color: ColorPalettes.instance.primary,
          child: Row(children: [
            cpnCircleImage(
                url: decodeMediaUrl(UserManager.instance.avatar.value),
                width: 130.w,
                height: 130.w,
                defaultPlaceHolderAssetName: "ic_default_avatar",
                defaultErrorAssetName: "ic_default_avatar"),
            SizedBox(width: 24.w),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (UserManager.instance.nickname.value.isNotEmpty)
                          ? UserManager.instance.nickname.value
                          : "登录/注册",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 34.w,
                          color: ColorPalettes.instance.firstText),
                    ),
                    SizedBox(height: 6.w),
                    Text(
                      UserManager.instance.signature.value,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 28.w,
                          color: ColorPalettes.instance.secondText),
                    )
                  ],
                )),
            Image.asset("ic_arrow_right".webp,
                width: 48.w,
                height: 48.w,
                color: ColorPalettes.instance.secondIcon)
          ])),
    );
  }

  Widget _userMenuInfo() {
    return Card(
        elevation: 2.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.w),
        ),
        margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.w),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.w),
            child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.w)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _itemMenu(
                          icon: "ic_my_device",
                          text: "Device",
                          paddingHorizontal: 25.w,
                          paddingVertical: 30.w,
                          onTap: () {}),
                      _itemGap(),
                      _itemMenu(
                          icon: "ic_my_notify",
                          text: "Notification setting",
                          paddingHorizontal: 25.w,
                          paddingVertical: 30.w,
                          onTap: () {}),
                      _itemGap(),
                      _itemMenu(icon: "ic_my_secury",
                          text: "Account security",
                          paddingHorizontal: 25.w,
                          paddingVertical: 30.w,
                          onTap: () {}),
                      _itemGap(),
                      _itemMenu(
                          icon: "ic_my_timezone",
                          text: "Time zone （UTC+8）",
                          paddingHorizontal: 25.w,
                          paddingVertical: 30.w,
                          onTap: () {}),
                      _itemGap(),
                      _itemMenu(icon: "ic_my_about",
                          text: "About",
                          paddingHorizontal: 25.w,
                          paddingVertical: 30.w,
                          onTap: () {
                            print("object");
                          }),
                    ]))
        )
    );
  }

  Widget _itemMenu({ required String icon, required String text,required double paddingHorizontal, required double paddingVertical,required VoidCallback onTap}){
    return  Material(
      color: Colors.transparent,
      child:
      InkWell(
        onTap: onTap,
        child:
        GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Padding(padding: EdgeInsets.only(
                left: paddingHorizontal,
                right: paddingHorizontal,
                top: paddingVertical,
                bottom: paddingVertical),
                child: Row(
                  children: [
                    Image.asset(icon.webp,
                        width: 50.w,
                        height: 50.w,
                        fit: BoxFit.contain),
                    SizedBox(width: 10.w),
                    Text(text,
                        style: TextStyle(
                            color: const Color(0xFF0F1010),
                            fontSize: 34.sp))
                  ],
                ))
        ),
      ),
    );
  }

  Widget _itemGap(){
    return SizedBox(width: double.infinity,
        height: 1.w,
        child: Container(color: const Color(0xffE5E6EB)));
  }

}
