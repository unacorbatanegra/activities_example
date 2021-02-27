import '../insfrastructure/hive_setting.dart';

import '../insfrastructure/infrastructure.dart';

mixin HiveHelper {
  static bool get isAnonymous =>
      HiveHelperSettings.get('isAnonymous') as bool ?? false;
  static bool get isFirstRun => _isFirstRun();

  static bool _isFirstRun() {
    final repository = HiveRepository<dynamic>();
    final isFirstRun = repository.get('settings', 'isFirstRun') as bool ?? true;
    if (isFirstRun) {
      repository.put('settings', 'isFirstRun', false);
    }
    return isFirstRun;
  }
}
