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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: Column(
          children: [
            _userBasicInfo()
          ],
        ),
      ),
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



}
