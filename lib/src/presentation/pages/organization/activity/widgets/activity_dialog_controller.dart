import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityDialogController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController? controller;

  @override
  void onInit() {
    controller ??= TextEditingController();
    init();

    super.onInit();
  }

  void init() {
    if (Get.arguments != null) {
      controller!.text = Get.arguments as String;
    }
  }

  void onAccept() {
    if (!formKey.currentState!.validate()) return;
    Get.back(result: controller!.text);
  }

  String? validator(String? value) =>
      value!.isEmpty ? 'Value must not be empty' : null;
  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
