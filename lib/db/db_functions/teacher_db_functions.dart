import 'package:edu_trak/db/hive_boxes/hive_boxes.dart';
import 'package:edu_trak/models/teacher_model/teacher_model.dart';

class TeacherDbFunctions {
  static final box = HiveBoxes.teacherBox;

  static Future<void> insert(TeacherModel model) async {
    final key = await box!.add(model);
    model.id = key;
  }

  static Future<List<TeacherModel>> getAll() async {
    final List<TeacherModel> list = [];

    for (var key in box!.keys) {
      final model = box!.get(key);
      if (model != null) {
        model.id = key as int;

        list.add(model);
      }
    }

    return list;
  }

  static Future<void> update(TeacherModel model) async {
    await box!.put(model.id, model);
  }

  static Future<void> delete(int? id) async {
    await box!.delete(id);
  }
}
