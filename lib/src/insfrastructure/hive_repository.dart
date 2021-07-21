import 'package:hive/hive.dart';

class HiveRepository<T> {
  T? get(String boxName, String key) {
    final box = Hive.box<T>(boxName);
    return box.get(key);
  }

  List<T> getList(String boxName) {
    final box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  void clear(String boxName) {
    final box = Hive.box<T>(boxName);
    box.clear();
  }

  void put(String boxName, String key,T data) {
    final box = Hive.box<T>(boxName);
    box.put(key, data);
  }

  void delete(String boxName, String key) {
    final box = Hive.box<T>(boxName);
    box.delete(key);
  }
}
