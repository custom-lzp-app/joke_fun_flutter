import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:druid_pamigo_flutter/common/ext/asset_ext.dart';
import 'package:druid_pamigo_flutter/router/routers.dart';
import 'package:druid_pamigo_flutter/theme/color_palettes.dart';
import 'package:lottie/lottie.dart';

import 'index_logic.dart';

/// 首页
class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    _customBottomNavigationBarItem("navi_home".webp, "navi_home_press".webp, "Home"),
    _customBottomNavigationBarItem(
        "navi_activity".webp, "navi_activity_press".webp, "Activity"),
    _customBottomNavigationBarItem(null, null, ""),
    _customBottomNavigationBarItem(
        "navi_geofence".webp,  "navi_geofence_press".webp, "Geofence"),
    _customBottomNavigationBarItem("navi_mine".webp, "navi_mine_press".webp, "Account"),
  ];

  static BottomNavigationBarItem _customBottomNavigationBarItem(
      String? defaultImage, String? activeImage, String label) {
    return BottomNavigationBarItem(
        icon: defaultImage == null
            ? const Icon(null)
            : Image.asset(defaultImage,
                width: 44.w,
                height: 44.w,
                color: ColorPalettes.instance.secondIcon),
        activeIcon: defaultImage == null
            ? const Icon(null)
            : Image.asset(defaultImage,
            width: 44.w,
            height: 44.w,
            color: ColorPalettes.instance.primary),

        // activeIcon: activeImage == null
        //     ? const Icon(null)
        //     : Obx(() {
        //         return RepaintBoundary(
        //           child: ColorFiltered(
        //               colorFilter: ColorFilter.mode(
        //                 ColorPalettes.instance.primary,
        //                 BlendMode.srcIn,
        //               ),
        //               child: Lottie.asset(activeImage,
        //                   repeat: false, width: 44.w, height: 44.w)),
        //         );
        //       }),
        label: label);
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<IndexLogic>();

    return Obx(() =>
        Scaffold(
          body: PageView(
            controller: logic.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: logic.navPages,
          ),
          backgroundColor: const Color(0xFFFFFFFF),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
          //要实现中间的按钮凸起效果，这行起作用
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8.0,
            // backgroundColor: (logic.index.value != 1)
            //     ? ColorPalettes.instance.background
            //     : Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: logic.index.value,
            fixedColor: ColorPalettes.instance.primary,
            unselectedItemColor: ColorPalettes.instance.secondText,
            items: bottomNavigationBarItems,
            onTap: (int index) {
              logic.navigate(index);
            },
          ),
          //   floatingActionButton: FloatingActionButton(
          //     backgroundColor: Colors.transparent,
          //     //ColorPalettes.instance.primary,
          //    // elevation: 1.0,
          //     child: Image.asset("navi_pet".webp,
          //         width: 210.w, height: 210.w),
          //     onPressed: () {
          //       AppRoutes.jumpPage(AppRoutes.publishPage, needLogin: true);
          //     },
          //   ),
          // ));
          floatingActionButton: RawMaterialButton(
            // fillColor: Colors.transparent,
            splashColor:Colors.transparent,
            focusColor:Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor:  Colors.transparent,
            elevation: 1.0,
            child: Image.asset("navi_pet".webp,
                width: 130.w, height: 130.w),
            onPressed: () {
              AppRoutes.jumpPage(AppRoutes.publishPage, needLogin: true);
            },
          ),
        ));
  }
}
