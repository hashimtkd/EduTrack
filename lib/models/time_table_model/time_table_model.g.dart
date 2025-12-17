// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_table_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeTableModelAdapter extends TypeAdapter<TimeTableModel> {
  @override
  final int typeId = 4;

  @override
  TimeTableModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeTableModel(
      id: fields[0] as int?,
      batchId: fields[1] as int,
      day: fields[2] as String,
      period: fields[3] as int,
      subjectId: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TimeTableModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.batchId)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.period)
      ..writeByte(4)
      ..write(obj.subjectId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeTableModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
