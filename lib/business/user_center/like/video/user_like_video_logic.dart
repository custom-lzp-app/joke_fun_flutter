import 'package:druid_pamigo_flutter/common/view_state/simple_view_state_paging_logic.dart';
import 'package:druid_pamigo_flutter/http/retrofit_client.dart';
import 'package:druid_pamigo_flutter/models/base_result.dart';
import 'package:druid_pamigo_flutter/models/video_entity.dart';

class UserLikeVideoLogic extends SimpleViewStatePagingLogic {
  String targetUserId = "";

  @override
  Future<BaseResult<List<VideoEntity>>> requestFuture(String pageNum) {
    return RetrofitClient.instance.apiService
        .getUserLikeVideoList(targetUserId, pageNum);
  }
}
