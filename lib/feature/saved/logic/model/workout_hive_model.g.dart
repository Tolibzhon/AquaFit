// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutHiveModelAdapter extends TypeAdapter<WorkoutHiveModel> {
  @override
  final int typeId = 0;

  @override
  WorkoutHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutHiveModel(
      id: fields[0] as int,
      title: fields[1] as String,
      duration: fields[3] as int,
      date: fields[5] as DateTime,
      day: fields[4] as int,
      calories: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.calories)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.day)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
