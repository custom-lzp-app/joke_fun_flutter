import 'package:druid_pamigo_flutter/business/common/logic/joke_list_logic.dart';
import 'package:druid_pamigo_flutter/http/retrofit_client.dart';
import 'package:druid_pamigo_flutter/models/base_result.dart';
import 'package:druid_pamigo_flutter/models/joke_detail_entity.dart';


class UserCollectLogic extends JokeListLogic {
  @override
  Future<BaseResult<List<JokeDetailEntity>>> requestFuture(String pageNum) {
    return RetrofitClient.instance.apiService.getCollectJokeList(pageNum);
  }
}
