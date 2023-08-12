import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
  static Future<int> getWaterCons() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('WaterCons') ?? 0;
  }

  static Future<void> setWaterCons(int waterCons) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('WaterCons', waterCons);
  }

  static Future<int> getWorkouts() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Workouts') ?? 0;
  }

  static Future<void> setWorkouts(int workouts) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Workouts', workouts);
  }

  static Future<List<String>> getIsChek() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList('IsChek') ?? [];
  }

  static Future<void> setIsChek(List<String> isChek) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('IsChek', isChek);
  }


  static Future<int> getDay() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Day') ?? 0;
  }

  static Future<void> setDay(int day) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Day', day);
  }
}
