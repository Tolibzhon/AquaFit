import 'package:shared_preferences/shared_preferences.dart';

class LocalDoneDaysDataSource {
  static const String key = 'daysDone';
  static Future<List<String>> getDoneDays() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  static Future<void> setDoneDay(String value) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getDoneDays();
    list.add(value);
    prefs.setStringList(key, list);
  }
}
