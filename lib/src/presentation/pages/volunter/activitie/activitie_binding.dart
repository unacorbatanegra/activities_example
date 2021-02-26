import 'package:get/instance_manager.dart';

import '../../../../domain/domains.dart';
import 'activitie_controller.dart';

class ActivitieVolunterBinding extends Bindings {
  @override
  void dependencies() => Get.put<ActivitieVolunterController>(
        ActivitieVolunterController(domain: ActivitieDomain()),
      );
}
