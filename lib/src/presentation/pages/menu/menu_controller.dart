import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';
import 'extension.dart';
import 'widgets/items.dart';
import 'widgets/role_dialog/role_dialog.dart';

class MenuController extends GetxController {
  final conectivity = Connectivity();

  final UserDomain userDomain;

  final _currentIndex = 0.obs;
  final _isLoading = false.obs;
  final _currentRole = Rx<Role>(Role.organization);

  MenuController({
    @required this.userDomain,
  }) : assert(userDomain != null);

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    _isLoading(true);
    final user = await userDomain.get(userDomain.currentUserUid);
    _currentRole(user.role);
    if (HiveHelper.isFirstRun) {
      Get.dialog(
        RoleDialog(),
        arguments: user?.role,
        barrierDismissible: false,
      );
    }
    print(user?.toJson());
    conectivity.onConnectivityChanged.listen(
      (result) => result == ConnectivityResult.none
          ? Get.showSnackBar(
              const SnackBar(
                content: Text('No connection :('),
                duration: Duration(days: 1),
              ),
            )
          : Get.hideSnackBar(),
    );
    _isLoading(false);
  }

  Widget get currentChild => Items.pages[_currentRole().index][currentIndex];

  List<BottomNavigationBarItem> get buttoms => Items.buttons;

  bool get isLoading => _isLoading.value;
  Role get role => _currentRole.value;
  int get currentIndex => _currentIndex.value;

  void changePage(int value) =>
      value != _currentIndex.value ? _currentIndex.value = value : () {};
}
