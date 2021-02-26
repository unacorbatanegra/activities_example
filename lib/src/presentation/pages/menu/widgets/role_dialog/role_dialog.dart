import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'role_controller.dart';

class RoleDialog extends StatelessWidget {
  const RoleDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RoleController(),
      builder: (_) => _RoleDialog(),
    );
  }
}

class _RoleDialog extends GetView<RoleController> {
  const _RoleDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'INFORMATION',
        style: Get.textTheme.subtitle1.copyWith(
            fontSize: 20,
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.bold),
      ),
      content: Text('asda'),
    );
  }
}
