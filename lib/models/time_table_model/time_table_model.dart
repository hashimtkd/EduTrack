import 'package:hive/hive.dart';
part 'time_table_model.g.dart';

@HiveType(typeId: 4)
class TimeTableModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int batchId;

  @HiveField(2)
  String day;

  @HiveField(3)
  int period;

  @HiveField(4)
  int subjectId;

  TimeTableModel({
    this.id,
    required this.batchId,
    required this.day,
    required this.period,
    required this.subjectId,
  });
}
