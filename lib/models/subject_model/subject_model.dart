import 'package:hive_flutter/adapters.dart';
part 'subject_model.g.dart';

@HiveType(typeId: 2)
class SubjectModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String subject;

  SubjectModel({this.id, required this.subject});
}
