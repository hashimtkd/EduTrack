import 'package:hive/hive.dart';
part 'teacher_model.g.dart';

@HiveType(typeId: 3)
class TeacherModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int contactNumber;
  @HiveField(3)
  final String email;
  @HiveField(4)
  int? subjectId;

  TeacherModel({
    required this.id,
    required this.name,
    required this.contactNumber,
    required this.email,
    this.subjectId,
  });
}
