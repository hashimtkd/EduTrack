import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/attendanc_model/attendance_status_model.dart';

class AttendanceDbFunctions {
  static final box = HiveBoxes.attendanceStatusBox;

  static Future<void> insert(AttendanceStatusModel attendanceModel) async {
    final key = await box!.add(attendanceModel);
    attendanceModel.id = key;
    await getAll();
  }

  static Future<List<AttendanceStatusModel>> getAll() async {
    final List<AttendanceStatusModel> list = [];
    for (var key in box!.keys) {
      final model = box!.get(key);
      if (model != null) {
        model.id = key as int;

        list.add(model);
      }
    }

    return list;
  }
}
