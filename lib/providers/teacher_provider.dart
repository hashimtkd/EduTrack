import 'package:edu_trak/db/db_functions/teacher_db_functions.dart';
import 'package:edu_trak/models/teacher_model/teacher_model.dart';
import 'package:flutter/material.dart';

class TeacherProvider extends ChangeNotifier {
  List<TeacherModel>? _teacherModelList = [];
  List<TeacherModel>? get teacherModelList => _teacherModelList;
  TeacherModel? currentTeacher;
  Future<void> insert(TeacherModel model) async {
    await TeacherDbFunctions.insert(model);

    await getAll();
  }

  Future<void> getAll() async {
    _teacherModelList = await TeacherDbFunctions.getAll();
    if (_teacherModelList!.isNotEmpty) {
      currentTeacher = _teacherModelList!.last;
    }
    notifyListeners();
  }

  Future<void> delete(int? id) async {
    await TeacherDbFunctions.delete(id);
    await getAll();
  }

  Future<void> update(TeacherModel model) async {
    await TeacherDbFunctions.update(model);
    await getAll();
  }
}
