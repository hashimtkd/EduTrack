import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/time_table_model/time_table_model.dart';

class TimeTableDbFunctions {
  static final box = HiveBoxes.timeTableBox!;

  static Future<int> insert(TimeTableModel model) async {
    final newModel = TimeTableModel(
      id: null,
      batchId: model.batchId,
      day: model.day,
      period: model.period,
      subjectId: model.subjectId,
    );
    final key = await box.add(newModel);
    return key;
  }

  static Future<void> update(TimeTableModel model) async {
    await box.put(model.id, model);
  }

  static Future<List<TimeTableModel>> loadByBatch(int batchId) async {
    return box.values
        .where((e) => e.batchId == batchId)
        .toList()
        .cast<TimeTableModel>();
  }
}
