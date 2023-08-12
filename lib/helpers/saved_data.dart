import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
    //-----------
  static Future<List<String>> getChekTitle() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList('ChekTitle') ?? [];
  }

  static Future<void> setChekTitle(List<String> chekTitle) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('ChekTitle', chekTitle);
  }

  static Future<List<String>> getChekDay() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList('ChekDay') ?? [];
  }

  static Future<void> setChekDay(List<String> chekDay) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('ChekDay', chekDay);
  }

  //-----------

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

  static Future<List<String>> getIsChekTitle() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList('IsChekTitle') ?? [];
  }

  static Future<void> setIsChekTitle(List<String> isChekTitle) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('IsChekTitle', isChekTitle);
  }

  static Future<List<String>> getIsChekDay() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList('IsChekDay') ?? [];
  }

  static Future<void> setIsChekDay(List<String> isChekDay) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('IsChekDay', isChekDay);
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
static Future<int> getFour() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Four') ?? 0;
  }

  static Future<void> setFour(int day) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Four', day);
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
