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
}
