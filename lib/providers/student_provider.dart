import 'package:edu_trak/db/db_functions/student_db_functions.dart';
import 'package:edu_trak/models/student_model/student_model.dart';

import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  StudentProvider() {
    getAll();
  }
  List<StudentModel> _studentModelList = [];
  List<StudentModel> get studentModelList => _studentModelList;

  Future<void> insert(StudentModel studentModel) async {
    await StudentDbFunctions.insert(studentModel);
    await getAll();
  }

  Future<void> getAll() async {
    final list = await StudentDbFunctions.getAll();
    _studentModelList = list;
    print(list);

    notifyListeners();
  }

  Future<void> delete(int id) async {
    await StudentDbFunctions.delete(id);
    await getAll();
  }

  Future<void> update(StudentModel studentModel) async {
    await StudentDbFunctions.update(studentModel);
    await getAll();
    notifyListeners();
  }
}
