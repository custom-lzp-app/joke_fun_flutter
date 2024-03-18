import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:druid_pamigo_flutter/business/activity/activity_page.dart';
import 'package:druid_pamigo_flutter/business/common/event/app_lifecycle_state_event.dart';
import 'package:druid_pamigo_flutter/business/common/event/home_tab_index_changed_event.dart';
import 'package:druid_pamigo_flutter/business/common/event/index_navigation_index_changed_event.dart';
import 'package:druid_pamigo_flutter/business/home/home_pet.dart';
import 'package:druid_pamigo_flutter/business/account/mine_page.dart';
import 'package:druid_pamigo_flutter/business/publish/publish_page.dart';
import 'package:druid_pamigo_flutter/common/cpn/app_bar.dart';
import 'package:druid_pamigo_flutter/common/util/event_bus_manager.dart';

import '../../common/cpn/keep_alive_wrapper.dart';
import '../discovery/discovery_page.dart';
import '../geofence/geofence_page.dart';
import '../home/home_page.dart';
import '../login/login_lead_page.dart';
import '../login/login_page.dart';
import '../login/verifycode/verifycode_login_page.dart';
import '../message/message_page.dart';
import '../my/my_page.dart';

class IndexLogic extends GetxController with WidgetsBindingObserver {
  RxInt index = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  final List<Widget> navPages = [
    const KeepAliveWrapper(child: HomePet()),//HomePage()),
     const KeepAliveWrapper(child: ActivityPage()),//DiscoveryPage()),
    const KeepAliveWrapper(child: PublishPage()),
    const KeepAliveWrapper(child: GeofencePage()),//MessagePage()),
    const KeepAliveWrapper(child: MinePage())//MinePage()),//MyPage()),LoginLeadPage()),
  ];

  void navigate(int index) {
    this.index.value = index;
    pageController.jumpToPage(index);
    updateStatusBarColor(Colors.transparent, index != 1);
    eventBus.fire(IndexNavigationIndexChangedEvent(index));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    eventBus.fire(AppLifecycleStateEvent(state));
  }
}
