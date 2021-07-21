import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/domains.dart';
import '../../../../../models/models.dart';
import '../../../../../utils/utils.dart';
import '../../../../widgets/widgets.dart';

class RoleController extends GetxController {
  final role = Rxn<Role>();
  final _isLoading = false.obs;
  final UserDomain domain;

  RoleController({
    required this.domain,
  });

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    _isLoading(true);
    role(domain.currentUser!.role);
    _isLoading(false);
  }

  void onAccept() async {
    if (!await DialogHelper.ifDialog(
        'Are you sure do you wanna switch your account')) {
      return;
    }
    final user = domain.currentUser!;
    user.role = role();
    Get.dialog(ProcessingDialog);
    await domain.put(user);
    Get.close(1);
    Get.back(result: true);
  }

  bool get isLoading => _isLoading.value;
}
