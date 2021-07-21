import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/domains.dart';
import '../../../../models/models.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import 'widgets/activity_dialog.dart';

class ActivityOrganizationController extends GetxController {
  final ActivityDomain domain;

  final formKey = GlobalKey<FormState>();

  TextEditingController? nameController;
  TextEditingController? description;
  final activities = <String>[].obs;
  final _date = Rxn<DateTime>();
  Activity? activity;
  final _isEditing = false.obs;
  final _isLoading = false.obs;

  ActivityOrganizationController({required this.domain});

  @override
  void onInit() {
    nameController ??= TextEditingController();
    description ??= TextEditingController();

    init();
    super.onInit();
  }

  void delete() async {
    if (!await DialogHelper.ifDialog('''
Are you sure do you wanna delete this activitt, this action cannot undone''')) {
      return;
    }
    await domain.delete(activity!.uuid);
    Get.back(result: true);
  }

  void onDate() async {
    final result = await showDatePicker(
      context: Get.context!,
      currentDate: DateTime.now(),
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(365.days),
      lastDate: DateTime.now().add(1000.days),
      selectableDayPredicate: (_) => true,
    );
    print(result);
    if (result == null) return;
    _date.value = result;
  }

  String? phoneNumberValidator(String value) {
    if (value.isPhoneNumber) {
      return null;
    }
    return 'Please provide a valid number';
  }

  void accept() async {
    if (!formKey.currentState!.validate()) return;
    if (activities.isEmpty) {
      DialogHelper.infoDialog('Activities must not be empty');
      return;
    }
    Get.dialog(ProcessingDialog);
    await domain.put(
      Activity(
        uuid: activity?.uuid,
        name: nameController!.text,
        description: description!.text,
        activities: activities,
        organization: activity?.organization,
        date: date,
      ),
    );
    Get.close(1);
    Get.back(result: true);
  }

  String? validator(String? value) =>
      value!.isEmpty ? 'value must not be empty' : null;

  void init() async {
    _isLoading(true);
    activity = Get.arguments as Activity?;
    _isEditing.value = activity != null;
    if (isEditing) {
      nameController!.text = activity!.name!;
      description!.text = activity!.description!;
      _date.value = activity!.date;
      activities.assignAll(activity!.activities!);
    }
    _isLoading(false);
  }

  void deleteActivitie(int idx) => activities.removeAt(idx);

  void onTap(int idx) async {
    final result = await Get.dialog(
      ActivityDialog(),
      barrierDismissible: false,
      arguments: activities[idx],
    ) as String?;
    if (result == null) return;
    activities[idx] = result;
  }

  void onAdd() async {
    final result = await Get.dialog(
      ActivityDialog(),
      barrierDismissible: false,
    ) as String?;
    if (result == null) return;
    activities.add(result);
  }

  DateTime? get date => _date.value;
  bool get isEditing => _isEditing.value;
  bool get isLoading => _isLoading.value;
  String get dateFormat {
    if (date != null) {
      return Helpers.formatDate(date!);
    } else {
      return 'pick a date';
    }
  }

  @override
  void onClose() {
    nameController?.dispose();
    description?.dispose();
    super.onClose();
  }
}
