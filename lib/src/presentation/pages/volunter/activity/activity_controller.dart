import 'package:get/get.dart';

import '../../../../models/models.dart';

class ActivityVolunterController extends GetxController {
  final _activity = Rx<Activity>();

  final _isLoading = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    _isLoading(true);
    _activity(Get.arguments as Activity);
    _isLoading(false);
  }

  Activity get activity => _activity.value;

  bool get isLoading => _isLoading.value;
}
