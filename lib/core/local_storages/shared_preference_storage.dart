import 'package:flutter_tasks_md/core/local_storages/local_storages.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceStorage implements Localstorage{

  final SharedPreferences _prefs;

  SharedPreferenceStorage(this._prefs);


  @override
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    await _prefs.setStringList(key, value);
  }

  @override
  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  
}