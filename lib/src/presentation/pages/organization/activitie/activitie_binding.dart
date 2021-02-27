import 'package:get/instance_manager.dart';

import '../../../../domain/domains.dart';
import 'activitie_controller.dart';

class ActivitieOrganizationBinding extends Bindings {
  @override
  void dependencies() => Get.put<ActivitieOrganizationController>(
        ActivitieOrganizationController(domain: ActivitieDomain()),
      );
}
