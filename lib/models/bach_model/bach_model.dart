import 'package:hive/hive.dart';
part 'bach_model.g.dart';

@HiveType(typeId: 6)
class BatchModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String batchName;

  BatchModel({this.id, required this.batchName});
}
