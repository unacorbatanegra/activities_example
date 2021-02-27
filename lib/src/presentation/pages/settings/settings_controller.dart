import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../domain/domains.dart';
import '../menu/menu_controller.dart';
import '../menu/widgets/role_dialog/role_dialog.dart';

class SettingsController extends GetxController {
  final AuthDomain authDomain;

  SettingsController({
    @required this.authDomain,
  });

  void logOut() => authDomain.signOut();

  void changeRole() async {
    final result = await Get.dialog(
      RoleDialog(),
      barrierDismissible: false,
    ) as bool;
    if (result ?? false) {
      Get.find<MenuController>().refreshRole();
    }
  }
}
