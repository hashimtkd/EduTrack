import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/attendance_status_model.dart';

class AttendanceDbFunctions {
  static Future<void> insert(AttendanceStatusModel attendanceModel) async {
    final key = await HiveBoxes.attendanceStatusBox!.add(attendanceModel);
    attendanceModel.id = key;
    await getAll();
  }

  static Future<List<AttendanceStatusModel>> getAll() async {
    final List<AttendanceStatusModel> _list = HiveBoxes
        .attendanceStatusBox!
        .values
        .toList();
    print(_list);
    return _list;
  }
}
