import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/attendanc_model/attendance_status_model.dart';

class AttendanceDbFunctions {
  static Future<void> insert(AttendanceStatusModel attendanceModel) async {
    final key = await HiveBoxes.attendanceStatusBox!.add(attendanceModel);
    attendanceModel.id = key;
    await getAll();
  }

  static Future<List<AttendanceStatusModel>> getAll() async {
    final List<AttendanceStatusModel> list = HiveBoxes
        .attendanceStatusBox!
        .values
        .toList();
    print(list);
    return list;
  }
}
