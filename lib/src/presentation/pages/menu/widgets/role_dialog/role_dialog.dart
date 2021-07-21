import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/domains.dart';
import '../../../../../models/models.dart';
import 'role_controller.dart';
import 'widgets/role_widget.dart';

class RoleDialog extends StatelessWidget {
  const RoleDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RoleController(domain: UserDomain()),
      builder: (dynamic _) => _RoleDialog(),
    );
  }
}

class _RoleDialog extends GetView<RoleController> {
  const _RoleDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'SELECT ROLE',
        style: Get.textTheme.subtitle1!.copyWith(
          fontSize: 20,
          color: Get.theme.accentColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        width: Get.width,
        height: 150,
        child: Obx(
          () => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RoleWidget(
                        label: 'Organization',
                        onSelected: controller.role as void Function(Role),
                        value: Role.organization,
                        selectedValue: controller.role(),
                        iconData: Icons.business,
                      ),
                    ),
                    Expanded(
                      child: RoleWidget(
                        label: 'Volunter',
                        onSelected: controller.role as void Function(Role),
                        value: Role.volunter,
                        selectedValue: controller.role(),
                        iconData: Icons.people,
                      ),
                    ),
                  ],
                ),
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'CANCEL',
            style: Get.textTheme.button!.copyWith(
              color: Get.theme.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => Get.back(result: false),
        ),
        TextButton(
          child: Text(
            'ACCEPT',
            style: Get.textTheme.button!.copyWith(
              color: Get.theme.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: controller.onAccept,
        )
      ],
    );
  }
}
