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

  static Future<int> getOne() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('One') ?? 0;
  }

  static Future<void> setOne(int day) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('One', day);
  }

  static Future<int> getTwo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Two') ?? 0;
  }

  static Future<void> setTwo(int day) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Two', day);
  }

  static Future<int> getThree() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Three') ?? 0;
  }

  static Future<void> setThree(int day) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Three', day);
  }

  static Future<int> getFive() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Five') ?? 0;
  }

  static Future<void> setFive(int day) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Five', day);
  }

  static Future<int> getSix() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Six') ?? 0;
  }

  static Future<void> setSix(int day) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Five', day);
  }

  static Future<int> getSeven() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Seven') ?? 0;
  }

  static Future<void> setSeven(int day) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Seven', day);
  }
}
