import 'package:hive_flutter/adapters.dart';
part 'attendance_status_model.g.dart';

@HiveType(typeId: 5)
class AttendanceStatusModel {
  @HiveField(0)
  final String status;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  String? reason;
  @HiveField(3)
  final int? studentId;
  @HiveField(4)
  int? id;
  AttendanceStatusModel({
    required this.status,
    required this.date,
    this.reason,
    required this.studentId,
    this.id,
  });
}
