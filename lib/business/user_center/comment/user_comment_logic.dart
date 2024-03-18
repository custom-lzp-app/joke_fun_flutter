import 'package:flutter/gestures.dart';
import 'package:druid_pamigo_flutter/common/view_state/simple_view_state_paging_logic.dart';
import 'package:druid_pamigo_flutter/http/retrofit_client.dart';
import 'package:druid_pamigo_flutter/models/base_result.dart';
import 'package:druid_pamigo_flutter/models/comment_entity.dart';

class UserCommentLogic extends SimpleViewStatePagingLogic {

  @override
  Future<BaseResult<List<CommentEntity>>> requestFuture(String pageNum) {
    return RetrofitClient.instance.apiService.getCommentList(pageNum);
  }

}
