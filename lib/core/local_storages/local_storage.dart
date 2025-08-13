abstract class Localstorage {

   Future<void> setString(String key, String value);

    String? getString(String key);

    Future<void> setStringList(String key, List<String> value);

    List<String>? getStringList(String key);
    
    Future<void> remove(String key);
  
}
