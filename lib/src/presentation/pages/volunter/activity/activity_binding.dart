import 'package:get/instance_manager.dart';

import 'activity_controller.dart';

class ActivityVolunterBinding extends Bindings {
  @override
  void dependencies() => Get.put<ActivityVolunterController>(
        ActivityVolunterController(),
      );
}
