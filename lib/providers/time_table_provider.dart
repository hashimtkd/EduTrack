import 'package:edu_trak/db/db_functions/time_table_db_functions.dart';
import 'package:edu_trak/models/time_table_model.dart';
import 'package:flutter/material.dart';

class TimeTableProvider extends ChangeNotifier {
  List<TimeTableModel> timeTableList = [];

  Future<void> loadByBatch(int batchId) async {
    timeTableList = await TimeTableDbFunctions.loadByBatch(
      batchId,
    ); // your DB fetch
    notifyListeners(); // important
  }

  Future<void> insert(TimeTableModel model) async {
    final id = await TimeTableDbFunctions.insert(model); // returns Hive key
    final newModel = TimeTableModel(
      id: id,
      batchId: model.batchId,
      day: model.day,
      period: model.period,
      subjectId: model.subjectId,
    );
    timeTableList.add(newModel);
    notifyListeners();
  }

  Future<void> update(TimeTableModel model) async {
    await TimeTableDbFunctions.update(model); // update in DB
    final index = timeTableList.indexWhere((e) => e.id == model.id);
    if (index != -1) {
      timeTableList[index] = model; // update local list
      notifyListeners(); // refresh UI
    }
  }
}
