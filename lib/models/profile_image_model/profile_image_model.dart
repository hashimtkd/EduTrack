// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/adapters.dart';
part 'profile_image_model.g.dart';

@HiveType(typeId: 8)
class ProfileImageModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String profileImage;
  @HiveField(2)
  int? studentIdOrTeacherId;
  ProfileImageModel({
    this.id,
    required this.profileImage,
    this.studentIdOrTeacherId,
  });
}
