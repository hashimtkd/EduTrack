import 'package:edu_trak/db/db_functions/bach_db_functions.dart';
import 'package:edu_trak/models/bach_model/bach_model.dart';

import 'package:flutter/material.dart';

class BachProvider extends ChangeNotifier {
  List<BatchModel> _bachList = [];

  List<BatchModel> get bachtList => _bachList;

  Future<void> insert() async {
    await BachDbFunctions.insert();
    await getAll();
  }

  Future<void> getAll() async {
    _bachList = await BachDbFunctions.getAll();
    notifyListeners();
  }
}
