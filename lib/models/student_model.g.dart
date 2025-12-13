// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 1;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      id: fields[0] as int?,
      fullName: fields[1] as String,
      dateOfBirth: fields[2] as String,
      gender: fields[3] as String,
      guardianName: fields[4] as String,
      bloodGroup: fields[5] as String,
      address: (fields[6] as List).cast<String>(),
      bachId: fields[7] as int?,
      contactNumber: fields[8] as String,
      email: fields[9] as String,
      teacherId: fields[10] as int?,
      subjectId: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.dateOfBirth)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.guardianName)
      ..writeByte(5)
      ..write(obj.bloodGroup)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.bachId)
      ..writeByte(8)
      ..write(obj.contactNumber)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.teacherId)
      ..writeByte(11)
      ..write(obj.subjectId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
