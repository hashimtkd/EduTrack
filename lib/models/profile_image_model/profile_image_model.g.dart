// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileImageModelAdapter extends TypeAdapter<ProfileImageModel> {
  @override
  final int typeId = 8;

  @override
  ProfileImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileImageModel(
      id: fields[0] as int?,
      profileImage: fields[1] as String,
      studentIdOrTeacherId: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileImageModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.profileImage)
      ..writeByte(2)
      ..write(obj.studentIdOrTeacherId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
