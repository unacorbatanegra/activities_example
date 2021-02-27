import 'package:get/instance_manager.dart';

import 'activitie_controller.dart';

class ActivitieVolunterBinding extends Bindings {
  @override
  void dependencies() => Get.put<ActivitieVolunterController>(
        ActivitieVolunterController(),
      );
}
