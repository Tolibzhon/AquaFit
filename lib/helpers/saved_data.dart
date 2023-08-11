import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
  static Future<String> getChek() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('Chek') ?? '';
  }

  static Future<void> setChek(String chek) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('Chek', chek);
  }
}
