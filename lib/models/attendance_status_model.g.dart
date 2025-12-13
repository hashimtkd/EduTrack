// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_status_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceStatusModelAdapter extends TypeAdapter<AttendanceStatusModel> {
  @override
  final int typeId = 5;

  @override
  AttendanceStatusModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceStatusModel(
      status: fields[0] as String,
      date: fields[1] as DateTime,
      reason: fields[2] as String?,
      studentId: fields[3] as int?,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceStatusModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.reason)
      ..writeByte(3)
      ..write(obj.studentId)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceStatusModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
