import 'package:edu_trak/db/db_functions/subject_db_functions.dart';
import 'package:edu_trak/models/subject_model/subject_model.dart';

import 'package:flutter/material.dart';

class SubjectProvider extends ChangeNotifier {
  List<SubjectModel> _subjectList = [];

  List<SubjectModel> get subjectList => _subjectList;
  Future<void> insert() async {
    await SubjectDbFunctions.insert();
    await getAll();
  }

  Future<void> getAll() async {
    _subjectList = await SubjectDbFunctions.getAll();
    notifyListeners();
  }
}
