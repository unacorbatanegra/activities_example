import 'package:get/instance_manager.dart';

import '../../../../domain/domains.dart';
import 'activity_controller.dart';


class ActivityOrganizationBinding extends Bindings {
  @override
  void dependencies() => Get.put<ActivityOrganizationController>(
        ActivityOrganizationController(domain: ActivityDomain()),
      );
}
