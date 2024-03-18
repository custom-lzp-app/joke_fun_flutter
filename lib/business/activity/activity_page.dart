import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:druid_pamigo_flutter/common/ext/asset_ext.dart';

import '../../common/cpn/app_bar.dart';
import '../../theme/color_palettes.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalettes.instance.primary,
          title: const Text('Activity',
            style: TextStyle(
              fontSize: 20,
            ), textAlign: TextAlign.center, // 设置文本居中显示
          ),
          centerTitle: true, // 标题居中显示
        ),
        body: const Center(
          child: Text('This is the body of the screen'),
        ),
      ),
    );
  }
}