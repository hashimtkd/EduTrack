// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'teacher_model.g.dart';

@HiveType(typeId: 3)
class TeacherModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String contactNumber;
  @HiveField(3)
  final String email;
  @HiveField(4)
  int? subjectId;
  @HiveField(5)
  String? profileImagepath;
  @HiveField(6)
  final String qualification;
  @HiveField(7)
  int? profileImageId;

  TeacherModel({
    this.id,
    required this.name,
    required this.contactNumber,
    required this.email,
    this.subjectId,
    this.profileImageId,
    required this.qualification,
    this.profileImagepath,
  });
}
