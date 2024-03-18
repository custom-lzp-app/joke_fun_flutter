import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:druid_pamigo_flutter/common/ext/asset_ext.dart';

import '../../common/cpn/app_bar.dart';
import '../../theme/color_palettes.dart';

class GeofencePage extends StatelessWidget {
  const GeofencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalettes.instance.primary,
          title: const Text('GeoFence',
            style: TextStyle(
              fontSize: 20,
            ), textAlign: TextAlign.center, // 设置文本居中显示
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset("add_function".webp,
                  width: 40.w,
                  height: 40.w),
              onPressed: () {
                // 执行搜索操作
              },
            )
          ],
        ),
        body: Center(
          child: Text('This is the body of the screen'),
        ),
      ),
    );
  }
}