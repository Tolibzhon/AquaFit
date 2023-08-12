import 'package:hive_flutter/hive_flutter.dart';

part 'workout_hive_model.g.dart';

@HiveType(typeId: 0)
class WorkoutHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int calories;
  @HiveField(3)
  int duration;
  @HiveField(4)
  int day;
  @HiveField(5)
  DateTime date;
   @HiveField(6)
  int index;
  

  WorkoutHiveModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.date,
    required this.day,
    required this.calories,
    required this.index,
  });
  @override
  String toString() {
    return '$title $duration $day';
  }
}
