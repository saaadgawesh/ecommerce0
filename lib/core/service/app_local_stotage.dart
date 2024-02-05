import 'package:shared_preferences/shared_preferences.dart';

// class app_local_storage {
//   static String imageKey = 'image_key';
//   static String nameKey = 'name_key';
//   static cacheData(String key, String data) async {
//     var prefs = await SharedPreferences.getInstance();
//     prefs.setString(key, data); //set means acaish yany akhazen
//   }

//   static Future<String> getChached(String key) async {
//     var prefs = await SharedPreferences.getInstance();
//     return prefs.getString(key) ?? 'no data found'; //get ajeep ely metkaish
//   }

//   static void cacheBool(isUpload, bool bool) {}
// }
//*****************************************local storage sayed */

class AppLocal {
  static String imageKey = 'Image_Key';
  static String nameKey = 'Name_Key';
  static String isUpload = 'isUpload';
  static cacheData(String key, String data) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  static Future<String> getChached(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static cacheBool(String key, bool data) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, data);
  }

  static Future<bool> getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
