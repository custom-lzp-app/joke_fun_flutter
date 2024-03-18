import 'package:get/get.dart';
import 'package:druid_pamigo_flutter/business/common/logic/joke_list_video_play_helper_mixin.dart';
import 'package:druid_pamigo_flutter/common/view_state/view_state_logic.dart';
import 'package:druid_pamigo_flutter/http/retrofit_client.dart';
import 'package:druid_pamigo_flutter/models/comment_entity.dart';
import 'package:druid_pamigo_flutter/models/joke_detail_entity.dart';
import 'package:druid_pamigo_flutter/router/routers.dart';

class CommentDetailLogic extends ViewStateLogic with JokeListVideoPlayHelperMixin {
  final jokeDetailEntity = Rxn<JokeDetailEntity>();
  late CommentEntity commentEntity;

  @override
  void onInit() {
    super.onInit();
    monitorVideoActive();
  }

  @override
  void loadData() {
    super.loadData();
    commentEntity = Get.arguments["commentEntity"];
    int jokeId = Get.arguments["jokeId"];

    sendRequest(
        RetrofitClient.instance.apiService.getTargetJoke(jokeId.toString()),
        successCallback: (value) {
      jokeDetailEntity.value = value!;
    });
  }

  @override
  bool judgeVideoActive() {
    return AppRoutes.curPage.value == AppRoutes.commentDetailPage;
  }
}
