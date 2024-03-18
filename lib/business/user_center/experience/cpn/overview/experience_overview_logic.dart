import 'package:get/get.dart';
import 'package:druid_pamigo_flutter/common/view_state/view_state_logic.dart';
import 'package:druid_pamigo_flutter/http/retrofit_client.dart';
import 'package:druid_pamigo_flutter/models/experience_overview_entity.dart';

class ExperienceOverviewLogic extends ViewStateLogic {

  final overviewEntity = Rxn<ExperienceOverviewEntity>();

  @override
  void loadData() {
    super.loadData();
    sendRequest(RetrofitClient.instance.apiService.getExperienceOverview(),
    successCallback: (value) {
      overviewEntity.value = value;
    });
  }

}
