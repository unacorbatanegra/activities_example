import 'hive_repository.dart';

mixin HiveHelperSettings {
  static final _repository = HiveRepository<dynamic>();

  static dynamic get(String key) => _repository.get('settings', key);

  static void put(String key, dynamic data) =>
      _repository.put('settings', key, data);

  static void delete(String key) => _repository.delete('settings', key);
}
