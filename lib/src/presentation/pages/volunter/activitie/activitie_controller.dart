import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/domains.dart';
import '../../../../models/models.dart';
import '../../../widgets/widgets.dart';

class ActivitieVolunterController extends GetxController {
  final ActivitieDomain domain;

  TextEditingController nameController;
  TextEditingController description;

  final activities = <String>[].obs;
  final _date = Rx<DateTime>();
  Activitie activitie;
  final _isEditing = false.obs;
  final _isLoading = false.obs;

  ActivitieVolunterController({@required this.domain});

  @override
  void onInit() {
    nameController ??= TextEditingController();
    description ??= TextEditingController();

    init();
    super.onInit();
  }

  void delete() async {
    await domain.delete(activitie.uuid);
    Get.back(result: true);
  }

  void accept() async {
    if (nameController.text.isEmpty || description.text.isEmpty) return;
    Get.dialog(ProcessingDialog);
    await domain.put(
      Activitie(
        uuid: activitie?.uuid,
        name: nameController.text,
        description: description.text,
        activities: activities,
        organization: activitie?.organization,
        date: date,
      ),
    );
    Get.close(1);
    Get.back(result: true);
  }

  String validator(String value) =>
      value.isEmpty ? 'must fill all fields' : null;

  void init() async {
    _isLoading(true);
    activitie = Get.arguments as Activitie;
    _isEditing.value = activitie != null;
    if (isEditing) {
      nameController.text = activitie.name;
      description.text = activitie.description;
      _date.value = activitie.date;
      activities.assignAll(activitie.activities);
    }
    _isLoading(false);
  }

  DateTime get date => _date.value;
  bool get isEditing => _isEditing.value;
  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    nameController?.dispose();
    description?.dispose();
    super.onClose();
  }
}
