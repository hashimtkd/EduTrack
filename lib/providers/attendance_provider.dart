import 'package:edu_trak/db/db_functions/attendance_db_functions.dart';
import 'package:edu_trak/models/attendanc_model/attendance_status_model.dart';
import 'package:flutter/material.dart';

class AttendanceProvider extends ChangeNotifier {
  AttendanceProvider() {
    getAll();
  }
  Map<int, String> attendanceStatus = {};
  List<AttendanceStatusModel> _attendanceModelList = [];
  List<AttendanceStatusModel> get attendanceModelList => _attendanceModelList;

  Future<void> insert(AttendanceStatusModel attendace) async {
    await AttendanceDbFunctions.insert(attendace);
    await getAll();
  }

  Future<void> getAll() async {
    _attendanceModelList = await AttendanceDbFunctions.getAll();
    print(_attendanceModelList);
    notifyListeners();
  }
}
