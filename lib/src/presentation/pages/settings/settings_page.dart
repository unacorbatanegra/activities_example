import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import 'settings_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingsController(
        authDomain: AuthDomain(),
      ),
      builder: (dynamic _) => _SettingsPage(),
    );
  }
}

class _SettingsPage extends GetView<SettingsController> {
  const _SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.unfold_more),
                title: const Text('Change role'),
                onTap: controller.changeRole,
              ),
              Obx(
                () => controller.isAnonymous
                    ? ListTile(
                        leading: const Icon(Icons.login),
                        title: const Text('login'),
                        onTap: controller.logOut,
                      )
                    : ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('log out'),
                        onTap: controller.logOut,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
