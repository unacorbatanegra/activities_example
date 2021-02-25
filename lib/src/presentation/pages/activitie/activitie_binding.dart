import 'package:get/instance_manager.dart';
import '../../../domain/domains.dart';
import 'activitie_controller.dart';

class ActivitieBinding extends Bindings {
  @override
  void dependencies() => Get.put<ActivitieController>(
        ActivitieController(domain: ActivitieDomain()),
      );
}
