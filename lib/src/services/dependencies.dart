import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

abstract class Dependencies {
  static Future<void> init() async {
    return await handleHive();
  }

  static Future<void> handleHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter<User>(UserAdapter());
    Hive.registerAdapter<Role?>(RoleAdapter());
    await Future.wait(
      [
        Hive.openBox<User>('user'),
        Hive.openBox('settings'),
      ],
    );
    return;
  }
}
