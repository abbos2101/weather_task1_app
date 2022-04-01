import 'package:hive/hive.dart';

class TaskHive {
  final Box _box;

  const TaskHive(this._box);

  Future<void> saveCityCode(String value) async {
    await _box.put("CityCode", value);
  }

  Future<String> getCityCode() async {
    return await _box.get("CityCode", defaultValue: "tashkent");
  }

  Future<void> setIsLight(bool value) async {
    await _box.put("IsLight", value);
  }

  Future<bool> isLight() async {
    return await _box.get("IsLight", defaultValue: true);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
