import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../domain/domains.dart';
import '../../../services/services.dart';
import '../../../utils/utils.dart';
import '../menu/menu_controller.dart';
import '../menu/widgets/role_dialog/role_dialog.dart';

class SettingsController extends GetxController {
  final AuthDomain authDomain;
  final _isAnonymous = false.obs;
  SettingsController({
    @required this.authDomain,
  });
  @override
  void onInit() {
    _isAnonymous(HiveHelper.isAnonymous);
    super.onInit();
  }

  void logOut() => authDomain.signOut();

  void changeRole() async {
    if (HiveHelper.isAnonymous) {
      DialogHelper.infoDialog('You must login to acces this feature');
      return;
    }
    final result = await Get.dialog(
      RoleDialog(),
      barrierDismissible: false,
    ) as bool;
    if (result ?? false) {
      Get.find<MenuController>().refreshRole();
    }
  }

  bool get isAnonymous => _isAnonymous.value;
}
