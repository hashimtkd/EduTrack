import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String fullName;
  @HiveField(2)
  final String dateOfBirth;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String guardianName;
  @HiveField(5)
  final String bloodGroup;
  @HiveField(6)
  final List<String> address;
  @HiveField(7)
  final int? bachId;
  @HiveField(8)
  final String contactNumber;
  @HiveField(9)
  final String email;
  @HiveField(10)
  int? teacherId;
  @HiveField(11)
  int? subjectId;
  @HiveField(12)
  int? profileImageId;

  StudentModel({
    this.id,
    required this.fullName,
    required this.dateOfBirth,
    required this.gender,
    required this.guardianName,
    required this.bloodGroup,
    required this.address,
    required this.bachId,
    required this.contactNumber,
    required this.email,
    this.teacherId,
    this.subjectId,
    this.profileImageId,
  });
}
