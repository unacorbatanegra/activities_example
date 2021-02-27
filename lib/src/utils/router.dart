import 'package:get/get.dart';

import '../presentation/pages/bindings.dart';
import '../presentation/pages/pages.dart';
import 'utils.dart';

mixin CustomRouter {
  static final routes = [
    GetPage(
      name: RouteName.main,
      page: () => DeepLoginPage(),
      binding: DeepLoginBinding(),
    ),
    GetPage(
      name: RouteName.activityOrganization,
      page: () => ActivityOrganizationPage(),
      binding: ActivityOrganizationBinding(),
    ),
    GetPage(
      name: RouteName.activityVolunter,
      page: () => ActivityVolunterPage(),
      binding: ActivityVolunterBinding(),
    ),
  ];
}
