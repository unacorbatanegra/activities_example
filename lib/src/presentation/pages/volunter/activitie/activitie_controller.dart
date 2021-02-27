import 'package:get/get.dart';

import '../../../../models/models.dart';

class ActivitieVolunterController extends GetxController {
  final _activitie = Rx<Activitie>();

  final _isLoading = false.obs;

  ActivitieVolunterController();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    _isLoading(true);
    _activitie(Get.arguments as Activitie);
    _isLoading(false);
  }

  Activitie get activitie => _activitie.value;

  bool get isLoading => _isLoading.value;
}
